<%@page import="nation.web.tool.Tool"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
<%
  String root = request.getContextPath();
  session.setAttribute("memberno", 1);    //회원 번호 세션 
%>

<!DOCTYPE html> 
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Study Matching Web Site</title>
<!-------------------------- Web Logo Part -------------------------->
<link rel="shortcut icon" href="<%=root%>/menu/images/ico/Short Logo.png">
<!---------------------------------------------------------------------->
</head>

<style>

.active{
  background-color: #a9a9a9;
}

</style>

<link href="/study/my_pds/css/my_pds_style.css" rel='Stylesheet' type='text/css'>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<script type="text/javascript">  
$(document).ready(function(){
   
  $("tbody > tr").mouseover(function(){
    $("td", this).css("background-color", "rgb(222, 213, 213)");
  });
   
  $("tbody > tr").mouseout(function(){
    $("td", this).css("background-color", "#ffffff");
  });
  
  $('#all_recv_check').click(function(){
    if($('#all_recv_check').prop("checked")){
      $("input:checkbox[id=recv_check]").prop("checked",true);
    }else{
      $("input:checkbox[id=recv_check]").prop("checked",false);
    }
  });
  
  $('#all_send_check').click(function(){
    if($('#all_send_check').prop("checked")){
      $("input:checkbox[id=send_check]").prop("checked",true);
    }else{
      $("input:checkbox[id=send_check]").prop("checked",false);
    }
  });
  
  /* 좌측 사이드 메뉴 백그라운드 컬러 효과. */
  $('.msg_menu').click(function(){
    $(this).siblings().removeClass('active');
    $(this).addClass('active'); 
  });
  
  msg_recv_list();
  
  /* 1분 마다 리스트 reload */
  /* setInterval(function(){
    msg_recv_list()
  }, 60*1000); */
  
  /* var modal=$('#modal_common');
  
  if($('#modal_common').css('display')=='block'){
    alert("!!!!!!"); 
    $('#memid').keydown(function(){
      alert('!!!');
    });
  } */ 
});

/* 버튼 드롭다운 */
function dropdown(msg_no, event){
  var dropdown_menu=$('#dropdown_menu'+msg_no);
  var sWidth = window.innerWidth;
  var sHeight = window.innerHeight;
  
  var oWidth = dropdown_menu.width();
  var oHeight = dropdown_menu.height();
  
  //레이어가 나타날 위치를 셋팅한다.
  var divLeft = event.clientX + 10;
  var divTop = event.clientY + 5;
  
  //레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
  if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
  if( divTop + oHeight > sHeight ) divTop -= oHeight;

  // 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치
  if( divLeft < 0 ) divLeft = 0;
  if( divTop < 0 ) divTop = 0;
   
  dropdown_menu.css("position","fixed"); 
  dropdown_menu.css("display", "");
  dropdown_menu.css("left", divLeft);  // x위치 + 80px (우로 이동)
  dropdown_menu.css("top", divTop);  // y위치 - 200px(위로 이동)
}
  

/*
 * 검색 선 처리 구간
 * index=1 -> 받은 쪽지 리스트
 * index=2 -> 보낸 쪽지 리스트
 * index=3 -> 쪽지 보관함 (예정)
 * index=4 -> 내게 쓴 쪽지 리스트 (예정)
 */
function search_control(){
  
  var index=$('#search_area').val();
  
  if(index==1){
    msg_recv_list();
  }else if(index==2){
    msg_send_list();
  }
}

/*
 * 검색 조건 초기화.
 * index=1 -> 받은 쪽지 리스트
 * index=2 -> 보낸 쪽지 리스트
 * index=3 -> 쪽지 보관함 (예정)
 * index=4 -> 내게 쓴 쪽지 리스트 (예정)
 */
function search_clear(index){
  $('#search_area option:eq(0)').prop("selected", true);
  $('#search_condition option:eq(0)').prop("selected", true); 
  $('#msgword').val('');
  
  if(index==1){
    msg_recv_list();
  }else if(index==2){
    msg_send_list();
  }
}

/**
 * 받은 쪽지 리스트
 * memberno : 회원의 번호 (= 받는 사람의 번호) 
 */
function msg_recv_list(){
   
  var search_condition=$("#search_condition").val();  // 선택한 조건
  var msgword=$("#msgword").val();                   //검색창에 입력된 검색어
  
  console.log("search_condition:"+search_condition);
  console.log("msgword:"+msgword); 
  
  $.ajax({ 
    url: "./msg_recv_list.do",
    type: "GET",
    cache: false,    // 일반적으로 false
    dataType: "json", // or json
    data: "search_condition="+search_condition+"&msgword="+msgword,
    success: function(data){
      var add_tr=""; // tbody에 끼워넣을 tr 정보들.
      
      if(search_condition!='none'){  
        $('#category').html("<img src='./images/message.png'>받은쪽지함▶검색결과("+data[1].recv_search_count+"개)<span style='font-size:12px;'>검색어:"+msgword+"</span>");
      }else{
        $('#category').html("<img src='./images/message.png'>받은쪽지함"); 
      }
      
      $('#read_msg').css("display","none"); 
      $('#msg_send_list').css("display","none");      // 보낸 쪽지함 테이블 감추기.
      $('#msg_recv_list').css("display","");          // 받은 쪽지함 테이블 출력. 
      
      /* 
        data[0] --> list_info
        data[1] --> count_info
      */
      
      $('#msg_recv_title').html("받은쪽지함("+data[1].recv_all_count+")");
      $('#msg_send_title').html("보낸쪽지함("+data[1].send_all_count+")");
      
      var status=""; 
      
      if(data[0].list_info.length>0){  // 메세지 전송 성공 
        for(var i=0; i<data[0].list_info.length; i++){ 
          if(data[0].list_info[i].msg_confirm=="N"){
            status='<img src="./images/before_read.png">';
          }else{ 
            status='<img src="./images/after_read.png">';
          }
          add_tr+='<tr id="msg_info">'; 
          add_tr+='<td><input type="checkbox" id="recv_check" value='+data[0].list_info[i].msg_no+'></td>';
          add_tr+='  <td id="status">'+status+'<button style="margin-left: 20px;" class="btn btn-xs" onclick="msg_create(\''+data[0].list_info[i].memid+'\')">답장</button></td>';
          add_tr+='  <td style="text-align: center;">';
          add_tr+='  <div id="dropdown'+data[0].list_info[i].msg_no+'" class="dropdown">'; 
          add_tr+="    <button onclick='dropdown("+data[0].list_info[i].msg_no+", event);' class='btn btn-link' type='button' data-toggle='dropdown'>"+data[0].list_info[i].memid+"("+data[0].list_info[i].memname+")<span class='caret'></span></button>";
          add_tr+="    <ul id='dropdown_menu"+data[0].list_info[i].msg_no+"' class='dropdown-menu'>";
          add_tr+="      <li style='text-align:left;'><a onclick='javascript:wait();'><img src='/study/my_pds/images/mem_info.png'>회원정보</a></li>";
          add_tr+="      <li style='text-align:left;'><a onclick='javascript:message(1,"+data[0].list_info[i].memberno_send+");'><img src='/study/my_pds/images/message_add.png'>쪽지보내기</a></li>";
          add_tr+="      <li style='text-align:left;'><a onclick='javascript:wait();'>그외 기능</a></li>";
          add_tr+='    </ul>';
          add_tr+='  </div>';  
          add_tr+='</td>';    
          add_tr+="<td style='text-align: center; cursor:pointer;' onclick='read("+data[0].list_info[i].msg_no+", 1)'><a>"+data[0].list_info[i].msg_title+"</a></td>";
          add_tr+="<td style='text-align: center; cursor:pointer;' onclick='read("+data[0].list_info[i].msg_no+", 1)'><a>"+data[0].list_info[i].msg_content+"</a></td>"; 
          add_tr+="<td style='text-align: center;'>"+data[0].list_info[i].msg_date+"</td>";  
          /* add_tr+="<td style='text-align: center;'><img src='./images/msg_remove.png' style='cursor: pointer;' onclick='remove("+data[i].msg_no+");'></td>"; */
          add_tr+="</tr>";
        } 
        
        $("#read_msg").css('display', 'none');          // 읽기 DIV 감추기.
        $('#msg_none').html("");                        // 쪽지 리스트 없을시 출력되는 DIV
        $('#recv_list_tbody').html(add_tr);             // 끼워넣기
         
      }else{ // 메세지 전송 실패
        $('#recv_list_tbody').html("");
        $('#msg_none').html("<img src='./images/none_recv_msg.jpg' style='width:50%;'>");
      }
    },
    error: function (request, status, error){
      alert("실패");
    }
  });
}

/*
 * 보낸 쪽지함 리스트
 */
function msg_send_list(){
  var search_condition=$("#search_condition").val();  // 선택한 조건
  var msgword=$("#msgword").val();                   //검색창에 입력된 검색어
  
  console.log("search_condition:"+search_condition);
  console.log("msgword:"+msgword);
  
  $.ajax({  
    url: "./msg_send_list.do",
    type: "GET",      
    cache: false,    // 일반적으로 false
    dataType: "json", // or json
    data: "search_condition="+search_condition+"&msgword="+msgword,
    success: function(data){
      var add_tr=""; // tbody에 끼워넣을 tr 정보들. 
      var status="";
      
      if(search_condition!='none'){
        $('#category').html("<img src='./images/msg_send.png'>보낸쪽지함▶검색결과("+data[1].send_search_count+"개)<span style='font-size:12px;'>검색어:"+msgword+"</span>");
      }else{
        $('#category').html("<img src='./images/msg_send.png'>보낸쪽지함");
      }
      
      $('#msg_recv_list').css("display","none");  // 받은 쪽지함 테이블 감추기
      $('#msg_send_list').css("display","");      // 보낸 쪽지함 테이블 출력.
      
      $('#msg_recv_title').html("받은쪽지함("+data[1].recv_all_count+")");
      $('#msg_send_title').html("보낸쪽지함("+data[1].send_all_count+")");
        
      if(data[0].list_info.length>0){  // 보낸 쪽지 있음
        for(var i=0; i<data[0].list_info.length; i++){
          if(data[0].list_info[i].msg_confirm=="N"){
            status='<img src="./images/before_read.png">미확인';
          }else{
            status='<img src="./images/after_read.png">확인';
          }
          add_tr+='<tr id="msg_info">';
          add_tr+='<td><input type="checkbox" id="send_check" value='+data[0].list_info[i].msg_no+'></td>'; 
          add_tr+='  <td id="status" style="text-align: center;">'+status; 
          add_tr+='  <td style="text-align: center;">';
          add_tr+='  <div id="dropdown'+data[0].list_info[i].msg_no+'" class="dropdown">';
          add_tr+="    <button onclick='dropdown("+data[0].list_info[i].msg_no+", event);' class='btn btn-link' type='button' data-toggle='dropdown'>"+data[0].list_info[i].memid+"("+data[0].list_info[i].memname+")<span class='caret'></span></button>";
          add_tr+="    <ul id='dropdown_menu"+data[0].list_info[i].msg_no+"' class='dropdown-menu'>";
          add_tr+="      <li style='text-align:left;'><a onclick='javascript:wait();'><img src='/study/my_pds/images/mem_info.png'>회원정보</a></li>";
          add_tr+="      <li style='text-align:left;'><a onclick='javascript:message(1,"+data[0].list_info[i].memberno_send+");'><img src='/study/my_pds/images/message_add.png'>쪽지보내기</a></li>";
          add_tr+="      <li style='text-align:left;'><a onclick='javascript:wait();'>그외 기능</a></li>";
          add_tr+='    </ul>';
          add_tr+='  </div>';
          add_tr+='</td>';  
          add_tr+="<td style='text-align: center; cursor:pointer;' onclick='read("+data[0].list_info[i].msg_no+", 2)'><a>"+data[0].list_info[i].msg_title+"</a></td>";
          add_tr+="<td style='text-align: center; cursor:pointer;' onclick='read("+data[0].list_info[i].msg_no+", 2)'><a>"+data[0].list_info[i].msg_content+"</a></td>";
          add_tr+="<td style='text-align: center;'>"+data[0].list_info[i].msg_date+"</td>"; 
          add_tr+="<td style='text-align: center;'>"+data[0].list_info[i].msg_rev_date+"</td>"; 
          /* add_tr+="<td style='text-align: center;'><img src='./images/msg_remove.png' style='cursor: pointer;' onclick='remove("+data[i].msg_no+");'></td>"; */
          add_tr+="</tr>";
        }
        
        $("#read_msg").css('display', 'none');   // 읽기 DIV 감추기.
        $('#msg_none').html("");
        $('#send_list_tbody').html(add_tr);  // 끼워넣기
        
      }else{ // 보낸 쪽지 없음 
        $('#send_list_tbody').html("");  // 끼워넣기
        $('#msg_none').html("<img src='./images/none_send_msg.jpg' style='width:50%;'>");
      }
    },
    error: function (request, status, error){
      alert("실패");
    }
  });
}

/*
 * 쪽지 보내기 폼
 */
function msg_create(memid){ 
  var modal=$('#modal_common');
  $('#modal_title', modal).html("<span>쪽지 보내기</span>");
  
  var body="";
  if(memid==null){
    body+="<label style='font-size:0.8em;'>받는이</label><br>";
    body+="<input type='text' style='margin-bottom:0px;' id='memid' placeholder='받는이 ID'>";
    body+="<button class='btn btn-sm' onclick='search_target();'>찾기</button><span style='font-size:0.7em;'>(ID검사 후 전송 가능)</span><br>";
  }else{
    body+="<label style='font-size:0.8em;'>받는이:</label>";
    body+="<span style='margin-bottom:0px;' id='memid'>"+memid+"</span><br>";
  }
  
  body+="<label style='font-size:0.8em;'>제목</label><br>";
  body+="<input type='text' style='width:98%;' id='msg_title' placeholder='제목입력'><br>"; 
  body+="<label style='font-size:0.8em;'>내용</label>";
  body+="<textarea id='msg_content' style='resize:none; font-size:0.7em; width:98%; height:200px;' placeholder='내용 입력'>";
  $('#modal-body', modal).html(body); 
  
  var footer="";
  if(memid==null){
    footer+='<button type="button" id="send_btn" class="btn btn-info" onclick="msg_create_proc();" disabled>전송</button>';
  }else{ 
    footer+='<button type="button" id="send_btn" class="btn btn-info" onclick="msg_create_proc(\''+memid+'\');">전송</button>'; 
  }
  footer+='<button type="button" class="btn btn-info" data-dismiss="modal">취소</button>';
  $('#modal-footer', modal).html(footer);
  
  modal.modal();
   
}

/**
 * 답장 보내기 폼
 */
function msg_reply(){
  
}

/*
 * 보낼 회원 찾기(회원의 유무를 판단)
 */
function search_target(send_memid){ 
  var memid=$('#memid').val();   // 받는이 아이디 값
  
  $.ajax({ 
    url: "./check_memid.do",
    type: "POST",      
    cache: false,    // 일반적으로 false
    dataType: "json", // or json
    data: "memid="+memid,
    success: function(data){
      if(data.result=="success"){  // 메세지 전송 성공
        alert("유효한 ID 입니다."); 
        $('#send_btn').prop('disabled', false);    // 버튼 활성화.
        
      }else{                                     // 메세지 전송 실패
        alert("존재하지 않는 ID 입니다.");
        $('#send_btn').prop('disabled', true);    // 버튼 활성화. 
        $('#memid').val("");                      // ID 입력부 초기화
        $('#memid').focus();                      // ID 입력부 포커스
      } 
    },
    error: function (request, status, error){
      
    }
  });
}

/*
 * 쪽지 보내기 처리
 * (회원 아이디 검증 후 "전송 버튼 활성화")
 */  
function msg_create_proc(send_memid){
  
  var memid="";
  
  if(send_memid==null){
    memid=$('#memid').val();   // 받는이 아이디 값
  }else{
    memid=send_memid;
  }
  
  var modal=$('#modal_common');
  var msg_title=$('#msg_title').val();  // 쪽지 제목 
  var msg_content=$('#msg_content').val();  // 쪽지 내용
   
  if(memid =='' || msg_title=='' || msg_content==''){
    alert('모든 입력사항을 입력하세요.');
    return false;
  }
  
  /*  [URL 인코딩]
   *  - URL은 사용가능한 문자가 제한되어 있다.
   *  - 한글 : UTF-8 사용
   *  encodeURI() : 특수문자를 제외한 나머지 문자 인코딩 URL전체 인코딩 시에 사용을 권고함.
   *  encodeURIComponent() : 알파벳, 숫자, Alphanumeric Characters 외의 대부분의 문자를 인코딩한다.
   *
   *  [URL 디코딩]
   *  decodeURIComponent() : encodeURIComponent()로 이스케이핑된 문자열을 정상적인 문자열로 되돌린다.
   *  한글 -> encode하면 이스케이핑되어 %+숫자의 형태가 된다. 이를 정상 문자열로 변환할 수 있다.
   */
  
  msg_title=encodeURIComponent(msg_title); 
  msg_content=encodeURIComponent(msg_content);
  
  var param="memid="+memid+"&msg_title="+msg_title+"&msg_content="+msg_content;
  $.ajax({
    url: "./msg_create.do",
    type: "POST",      
    cache: false,    // 일반적으로 false
    dataType: "json", // or json
    data: param,
    success: function(data){
      if(data.result=="OK"){  // 메세지 전송 성공
        alert("쪽지 전송 완료!");  
        modal.modal('hide'); // 모달창 닫기.
        msg_send_list(); 
        //msg_recv_list();    // 쪽지 리스트 로드  
        
      }else{                // 메세지 전송 실패
        alert("쪽지 전송에 실패했습니다.\n 다시 시도해주세요.");
      }
    },
    error: function (request, status, error){
      //에러시
    }
  });
}

/* 쪽지 삭제 확인 */   
function remove(index){
  // 체크 된 checkBox들의 값을 구해야 한다. --> ex) check1, check10, check20 ...
  // 1, 10, 20은 msg_no와 같다.
  // JSON.stringify(); ==> JSON을 String화 한다.(직렬화)
  // JSON.parse(); ==> String을 JSON형태로 변환한다.
  // JSON 형태 : {key:"value", key:"value"}

  var modal=$('#modal_common');
  $('#modal_title', modal).html("<span>쪽지 삭제</span>");
  
  $('#modal-body', modal).html("삭제 합니까?");
  
  var footer=""; 
  footer+='<button type="button" class="btn btn-info" onclick="remove_proc('+index+');" data-dismiss="modal">삭제</button>';
  footer+='<button type="button" class="btn btn-info" data-dismiss="modal">취소</button>';
  $('#modal-footer', modal).html(footer); 
  
  modal.modal(); 
}

/* 쪽지 삭제 처리 */
function remove_proc(index){  // index=1 -> 받은 쪽지함
                               // index=2 -> 보낸 쪽지함
  var arr=new Array();  // Object를 배열로 저장할 Array
  var obj=new Object(); // key, value형태로 저장할 Object  
  
  var url="";
  
  if(index==1){  // 받은 쪽지함에서 체크된 쪽지 삭제.
    for(var i=0; i<$('input:checkbox[id=recv_check]').length; i++){
      /* console.log($('input:checkbox')[i]); */
      if($('input:checkbox[id=recv_check]:eq('+i+')').prop("checked")==true){
        obj=new Object(); 
        obj.value=$('input:checkbox[id=recv_check]:eq('+i+')').val(); 
        arr.push($('input:checkbox[id=recv_check]:eq('+i+')').val());
      }
    }
    url="./msg_recv_remove.do";
  }else if(index==2){  // 보낸 쪽지함에서 체크된 쪽지 삭제.
    for(var i=0; i<$('input:checkbox[id=send_check]').length; i++){
      /* console.log($('input:checkbox')[i]); */
      if($('input:checkbox[id=send_check]:eq('+i+')').prop("checked")==true){
        obj=new Object(); 
        obj.value=$('input:checkbox[id=send_check]:eq('+i+')').val(); 
        arr.push($('input:checkbox[id=send_check]:eq('+i+')').val());
      } 
    }
    url="./msg_send_remove.do";
  }
  
  /* 선택한 쪽지가 없을 경우 */
  if(arr.length==0){
    alert("삭제하고자하는 쪽지를 선택하세요."); 
    return false;
  }
  
  /* 정상 처리 시작 */
  jQuery.ajaxSettings.traditional = true;
  $.ajax({ 
    url: url,
    type: "POST",      
    cache: false,    // 일반적으로 false
    dataType: "json", // or json 
    data: {checked:arr},  
    success: function(data){
      if(data.result=="ok"){   // 삭제 완료
        if(index==1){
          msg_recv_list();    // 받은 쪽지 리스트 로드
        }else{
          msg_send_list();    // 보낸 쪽지 리스트 로드 
        }
        alert("쪽지가 삭제되었습니다.");
      }else{
        alert("삭제 처리 실패!");
      }
    },
    error: function (request, status, error){
      alert("AJAX 실패");
    }
  });
}

/**
 * 쪽지 읽기
 * index값으로 보낸쪽지함 읽기인지, 받은 쪽지함 읽기인지 구분.
 * 구분에 따라 수신여부의 Proc 동작여부 결정.
 * 하나의 메소드로 두 동작을 처리하기 위해 index를 사용함. 
 */
function read(msg_no, index){
  $.ajax({ 
    url: "./read.do",
    type: "POST",      
    cache: false,    // 일반적으로 false
    dataType: "json", // or json 
    data: "msg_no="+msg_no+"&index="+index,
    success: function(data){
      $('#msg_recv_list').css("display","none");  // 받은 쪽지함 테이블 감추기 
      $('#msg_send_list').css("display","none");  // 보낸 쪽지함 테이블 감추기 
      //$('#search_msg').hide();
      var read_msg="";       // 읽기 폼 
      if(data.length!=""){   // 선택한 쪽지의 정보가 있을 때.
        console.log(data);
      
        alert(data.msg_content); 
        //data.msg_content=data.msg_content.replace(/\n/g, "<br />");
        
        if(index==0){
          $('#category').html("<img src='./images/after_read.png'>쪽지 읽기");  // 받은 쪽지함으로
          read_msg+="<button onclick='msg_recv_list()' class='btn btn-xs btn-info'>받은쪽지 목록</button>";
          read_msg+="<button style='margin-left:5px;' onclick='msg_recv_list()' class='btn btn-xs btn-success'><img src='./images/msg_reply.png'>답장</button>";
        }else{
          $('#category').html("<img src='./images/after_read.png'>쪽지 읽기");  // 보낸 쪽지함으로 
          read_msg+="<button style='margin-left:5px;' onclick='msg_send_list()' class='btn btn-xs btn-info'>보낸쪽지 목록</button>";
          read_msg+="<button style='margin-left:5px;' onclick='msg_recv_list()' class='btn btn-xs btn-success'><img src='./images/msg_reply.png'>답장</button>";
        }
        read_msg+="<ul>";
        if(index==2){
          read_msg+="  <li class='li_msg'><label class='label_msg'>보낸사람</label><span style='margin-right:20px;'> [나]("+data.sender_name+")</span>";
        }else{
          read_msg+="  <li class='li_msg'><label class='label_msg'>보낸사람</label><span style='margin-right:20px;'>"+data.sender_id+"("+data.sender_name+")</span>"; 
        }
        read_msg+="  <label class='label_msg'>받는사람</label><span>"+data.receiver_id+"("+data.receiver_name+")</span></li>";
        read_msg+="  <li class='li_msg'><label class='label_msg'>받은시간</label><span>"+data.msg_date+"</span></li>";
        read_msg+="  <li class='li_msg'><label class='label_msg'>제목</label><span>"+data.msg_title+"</span></li>";
        read_msg+="  <li class='li_none'><DIV>"+data.msg_content+"</DIV></li>";
        read_msg+="</ul>";
        
        $("#read_msg").html(read_msg);       // 읽기 폼 추가
        $("#read_msg").css('display', '');   // 읽기 폼 출력
      }else{
        alert("읽기 실패!");
      }
    },
    error: function (request, status, error){
      alert("AJAX 실패");
    }
  });
}

</script>  

<body>
<jsp:include page="/menu/top.jsp" flush="false" />
<DIV class='container' style="position: absolute; bottom: 40px; top: 115px; left: 0; right: 0; width: 100%;">
<DIV class='content'>

  <!-- 공통 모달창  -->
  <div class="modal fade" id="modal_common" role="dialog" style="display: none;">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h3 class="modal-title text-error" id='modal_title'></h3>
      </div>
      
      <div class="modal-body" id="modal-body"> 
      </div>
      
      <div class="modal-footer" id="modal-footer">
        
      </div>
    </div> 
  </div>
  <!-- 공통 모달 종료 -->
   
  <DIV style=" width: 190px; position: absolute; bottom: 0; left: 0; right: 0; top: 0; border: 0.5px solid #eee; padding-top: 15px;">
    <DIV style="text-align:center; width:100%;"> 
      <button class='btn btn-success' onclick='msg_create();'>쪽지 쓰기</button> 
      <button class='btn btn-success' onclick='self_msg_create();'>내게 쓰기</button>
    </DIV>
    
    <DIV style="position: absolute; top: 60px; height: 250px; border: 0.5px solid #eee; width: 100%;">
      <ul id='msg_menu_grp' style="margin-left: 5px;">   
        <li class='li_none msg_menu active' style="font-size: 0.9em;" onclick=search_clear(1);><img src='./images/message.png'><span id='msg_recv_title'>받은쪽지함</span></li>
        <li class='li_none msg_menu' style="font-size: 0.9em;" onclick=search_clear(2);><img src='./images/msg_send.png'><span id='msg_send_title'>보낸쪽지함</span></li>
        <li class='li_none msg_menu' style="font-size: 0.9em;" onclick=my_repo();><a><img src='./images/msg_repo.png'>쪽지보관함</a></li>
        <li class='li_none msg_menu' style="font-size: 0.9em;" onclick=self_repo();><a><img src='./images/self_msg.png'>내게쓴 쪽지함</a></li> 
      </ul>
    </DIV>
  </DIV>
  
  <DIV>
    <DIV>
      <DIV style="left:190px; top:0; right:0; bottom:0; position:absolute; border: 0.5px solid #eee; overflow: scroll;">
        <DIV id='aside_menu' style="position: relative; border-bottom: 0.5px solid #eee;">
          <DIV style="padding: 10px;">
            <DIV>
              <!-- 현재 위치 출력 -->
              <span id='category' style='float: left;'>받은 쪽지함</span>
              
              <!-- 쪽지 검색 창 -->
              <form id='search_msg' name='search_msg'> 
                <fieldset style="text-align: right;">
                  <select style="font-size: 14px;" id='search_area'> 
                    <option value='none'>선택하세요</option>
                    <option value='1'>받은쪽지</option> 
                    <option value='2'>보낸쪽지</option>
                    <option value='3'>내게쓴쪽지</option>
                  </select>  
                    
                  <select style="font-size: 14px;" id='search_condition'>
                    <option value="none">선택하세요</option>
                    <option value="sender_id">아이디</option>
                    <option value="msg_title">제목</option>
                    <option value="msg_content">내용</option> 
                  </select>
                  
                  <input class="form-search" style="margin-bottom: 0px;" type="text" id='msgword' name='msgword' placeholder="쪽지검색">
                  <button type="button" class='btn btn-link' onclick='search_control();'><img src='./images/search.png'>검색</button> 
                </fieldset>
              </form>
            </DIV>
          </DIV>
        </DIV>
        
        <DIV id="msg_recv_list" style="position: relative; display: none;">
          <DIV id='task_btn' style="position: relative; border-top: 0.5px solid #eee;">
            <button class='btn btn-xs btn-danger' onclick='remove(1);' style="border-radius:10px;"><img src='./images/msg_remove.png' title="삭제">삭제</button>
          </DIV>
          <TABLE class='table table-striped' style='border-radius:10px;'>
            <colgroup id='list_colgroup'>
              <col style='width: 3%;'/>
              <col style='width: 8%;'/> 
              <col style='width: 15%;'/> 
              <col style='width: 15%;'/>
              <col style='width: 40%;'/> 
              <col style='width: 7%;'/>
            </colgroup>
            <thead style="font-size: 0.9em;">
              <TR id='list_tr'>
                <TH><input type="checkbox" id='all_recv_check'></TH>
                <TH style='text-align: center ;'></TH>
                <TH style="text-align: center ;">보낸사람</TH>
                <TH style='text-align: center ;'>제목</TH>
                <TH style='text-align: center ;'>내용</TH>
                <TH style='text-align: center ;'>받은날짜</TH>
              </TR>
            </thead>
            <tbody style="font-size: 0.8em;" id='recv_list_tbody'>
            <!-- AJAX를 통해 <tr>태그 삽입 -->
            </tbody>
          </TABLE>
        </DIV>
        
        <DIV id="msg_send_list" style="position: relative; display: none;">
          <DIV id='task_btn' style="position: relative; border-top: 0.5px solid #eee;">
            <button class='btn btn-xs btn-danger' onclick='remove(2);' style="border-radius:10px;"><img src='./images/msg_remove.png' title="삭제">삭제</button>
          </DIV>
          <TABLE class='table table-striped' style='border-radius:10px;'>
            <colgroup id='list_colgroup'>
              <col style='width: 3%;'/>
              <col style='width: 8%;'/>
              <col style='width: 15%;'/> 
              <col style='width: 23%;'/> 
              <col style='width: 35%;'/>
              <col style='width: 7%;'/> 
              <col style='width: 7%;'/>   
            </colgroup>
            <thead style="font-size: 0.9em;">
              <TR id='list_tr'>
                <TH><input type="checkbox" id='all_send_check'></TH> 
                <TH style='text-align: center ;'>수신여부</TH>
                <TH style="text-align: center ;">받는사람</TH> <!-- 받는 사람 -->
                <TH style='text-align: center ;'>제목</TH>
                <TH style='text-align: center ;'>내용</TH>
                <TH style='text-align: center ;'>보낸날짜</TH>
                <TH style='text-align: center ;'>수신날짜</TH>
              </TR>
            </thead>
            <tbody style="font-size: 0.8em;" id='send_list_tbody'>
            <!-- AJAX를 통해 삽입 -->
            </tbody>
          </TABLE>
        </DIV>
        
        <DIV id='msg_none' style="text-align: center;">
          <!-- AJAX를 통해 삽입 -->
        </DIV>
        <DIV id='read_msg' style="display: none; padding: 30px; margin:10px; border: 0.2px solid;">
          <!-- AJAX를 통해 삽입 -->
        </DIV>
      </DIV>
    </DIV>
  </DIV>
    
</DIV> <!-- content END -->
</DIV> <!-- container END -->
<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
</html>