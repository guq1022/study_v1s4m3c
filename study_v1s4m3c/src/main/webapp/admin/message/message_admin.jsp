<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% 
  String root = request.getContextPath();
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

<link href="./css/msg_admin_style.css" rel='Stylesheet' type='text/css'>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> 

<!-- Google Chart 라이브러리 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<!-- 차트 관련 js -->
<script type="text/javascript"> 
  function google_draw(){
    google.charts.load('current', {'packages':['corechart']});
    
    /* 그래프의 형식은 자유로이 변경 가능!
      문제 1. drawChar()하기 전에 Ajax를 통해 필요한 데이터 list를 추출해야 한다.
      문제 2. 어떻게 데이터를 아래의 data에 넣을 것인가?
    */
    var test="hello";
    
    /* 그래프 출력을 수행  - CallBack 형태로 사용하는 듯.*/
    google.charts.setOnLoadCallback(drawChart);
  }
  
  /* 구글 그래프 그리는 함수 */
  function drawChart() {
    
    var test_data=['항목', '다리수'];
    
    var test_data2=['거미', 8];
    
    alert(typeof(test_data2));
    console.log(typeof(test_data2));
    console.log(test_data2);

    // 차트 데이터 설정 - 각 요소는 Array 형태의 데이터
    var data = google.visualization.arrayToDataTable([
      //['항목', '다리수'], // 항목 정의
      test_data,
      ['개', 4], // 항목, 값 (값은 숫자로 입력하면 그래프로 생성됨)
      ['메뚜기', 6],
      ['문어', 8],
      ['오징어', 10], 
      ['여기 운영자', 2],
      test_data2
    ]);

    // 그래프 옵션
    var options = {
      title : '다리 갯수', // 제목
      width : 600, // 가로 px
      height : 400, // 세로 px
      bar : {
        groupWidth : '80%' // 그래프 너비 설정 %
      },
      legend : {
        position : 'none' // 항목 표시 여부 (현재 설정은 안함) 
      },
      seriesType:'bars'
    };

    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
  
  /* 그래프 출력에 필요한 데이터 수신 */
  function graph_ajax(){
    jQuery.ajaxSettings.traditional = true;   // 이 설정이 없으면 recuritno[] : 1 의 형태로 전송이 된다.
    $.ajax({
      url: "./message_del_admin.ajax",
      type: "POST",
      cache: false,    // 일반적으로 false  
      dataType: "json", // or json 
      data: {},
      success: function(data){
        if(data.result=="OK"){   // 삭제 완료
          
        }else{
          alert("Not Ok..");
        }
      }, 
      error: function (request, status, error){
        alert("AJAX 실패");
      }
    });
  }
  
</script>

<script type="text/javascript">
$(document).ready(function(){
  
  msg_admin_list(1,10); 
   
  var timeStamp=new Date();    // 오늘 날짜 
  var ex_timestamp=new Date(); // 계산 후 날짜
  
  var year=timeStamp.getFullYear();
  var month=("0"+(timeStamp.getMonth()+1)).slice(-2);
  var day=("0"+timeStamp.getDate()).slice(-2);
  
  var ex_year=0;
  var ex_month=0;
  var ex_day=0;
   
  var now=year+"-"+month+"-"+day;  // 오늘 날짜("YY-MM-DD" 형태)
  var ex_now="";                  // 계산 후 날짜("YY-MM-DD" 형태)
  
  var date={
      'trans_date':function(ex_timestamp){
        ex_year=ex_timestamp.getFullYear(); 
        ex_month=("0"+(ex_timestamp.getMonth()+1)).slice(-2);
        ex_day=("0"+ex_timestamp.getDate()).slice(-2);
        ex_now=ex_year+"-"+ex_month+"-"+ex_day; 
        $("#first_day").val(ex_now); 
        $("#second_day").val(now);
      },
      'now':function(){
        $("#first_day").val(now);
        $("#second_day").val(now); 
      }
  }
   
  $("tbody > tr").mouseover(function(){
    $("td", this).css("background-color", "rgb(222, 213, 213)");
  });
  
  $("tbody > tr").mouseout(function(){
    $("td", this).css("background-color", "#ffffff");
  });
  
  $('#all_check').click(function(){
    if($('#all_check').prop("checked")){
      $("input:checkbox[id=checked]").prop("checked",true);
    }else{ 
      $("input:checkbox[id=checked]").prop("checked",false);
    }
  });
  
  $("#paging_change").change(function(){
    var page_num=$("#paging_change").val();
    msg_admin_list(1,page_num);
    /* location.replace("./message_admin.do?page_num="+page_num+"&nowPage=1&first_day=${first_day }&second_day=${second_day }&search_condition=${search_condition }&msgword=${msgword }"); */
  });
  
  $(".tab_btn").click(function(){
    $(this).siblings().removeClass('active');
    $(this).addClass('active');
  });
  
  // 날짜 선택 버튼에 따른 자동 날짜 값 입력
  $("#select_day").change(function(){
    ex_timestamp=new Date();    // 날짜 초기화.
    
    if($(this).val()=="Today"){ // 오늘 클릭
      date.now();
    }else if($(this).val()=="1 Week"){  // 1 Week 클릭
      ex_timestamp.setDate(ex_timestamp.getDate()-7); // 7일전 날짜.
      date.trans_date(ex_timestamp);
    }else if($(this).val()=="1 Month"){  
      ex_timestamp.setDate(ex_timestamp.getDate()-32); // 1달 전 날짜.
      date.trans_date(ex_timestamp);
    }else{ 
      date.now();
    }
  });
   
}); 

function search_control(){
  var first_day_val=$("#first_day").val();
  var second_day_val=$("#second_day").val();
  
  $("#page_num").val($("#paging_change").val()); 
  
  // 시작 날짜가 없으면 전체기간을 검색한다.
  if(first_day_val == ""){
    $("#second_day").val(now); 
  }
}  

function message_del_modal(){
  $("#modal_common").modal();
}

/**
 * 쪽지 삭제 처리 메소드
 */
function message_del_admin(){
  var nowPage=0;
  var arr=new Array();  // Object를 배열로 저장할 Array
  for(var i=1; i<$('input:checkbox').length; i++){
    /* console.log($('input:checkbox')[i]); */ 
    if($('input:checkbox:eq('+i+')').prop("checked")==true){
      arr.push($('input:checkbox:eq('+i+')').attr("data-msg_no"));
    }
  }
    
  //아무것도 선택 안했을 때. 
  if(arr.length==0){
    alert("삭제하고자 하는 쪽지를 선택하세요.");
    return false;
  }
   
  jQuery.ajaxSettings.traditional = true;   // 이 설정이 없으면 recuritno[] : 1 의 형태로 전송이 된다.
  $.ajax({
    url: "./message_del_admin.ajax",
    type: "POST",
    cache: false,    // 일반적으로 false  
    dataType: "json", // or json 
    data: {msg_no:arr, first_day:$("#first_day").val(), second_day:$("#second_day").val(), search_condition:$("#search_condition option:selected").val(), msgword:$("#msgword").val()},
    success: function(data){
      if(data.result=="OK"){   // 삭제 완료
        alert("삭제 처리 성공!!")
        nowPage=$(".span_box_2").text();   // EL을 ""안에 명시하면 문자열 형태, ""없이 하면 정수형 
        if(data.after_count % $("#paging_change").val() == 0){
          nowPage=nowPage-1;
          //console.log("페이징 변경 되야함.");
          if(nowPage<=0){
            nowPage=1; 
          }
        }
        msg_admin_list(nowPage); 
      }else{
        alert("삭제 처리 실패!");
      }
    }, 
    error: function (request, status, error){
      alert("AJAX 실패");
    }
  });
}

function msg_list(){
  $("#test_img").fadeOut(function(){
    $("#msg_send_admin").fadeOut();
    $("#msg_list").fadeIn(); 
  });
} 
 
function msg_send_admin(){
  $("#msg_list").fadeOut();
  $("#msg_send_admin").fadeIn(function(){
    google_draw();
    $("#test_img").fadeIn(); 
  });
}

/**
 * 전체보기 전 처리
 * 모든 조건을 초기화한다. 단, 페이지 계수는 유지
 */
function msg_list_clear(){
  var page_num=$("#paging_change option:selected").val();  // 현재 선택되어 있는 페이지 계수
  $("#select_day").val("날짜선택");
  $("#first_day").val("");   // 시작일 초기화
  $("#second_day").val("");  // 종료일 초기화
  $("#search_condition").val("none");  // 검색조건의 값을 none으로 변경.(초기화)
  //$("#search_condition option[value=none]").attr("selected","selected");  // 검색 조건 해제 (맨 처음으로 선택)
  $("#msgword").val("");     // 검색어 초기화
    
  msg_admin_list(1, page_num);
}

function msg_admin_list(nowPage, page_num){
  
  var page_num=$("#paging_change option:selected").val();  
  
  $.ajax({ 
    url: "./message_admin.ajax",
    type: "POST", 
    cache: false,    // 일반적으로 false
    dataType: "json", // or json
    data: {page_num:page_num, first_day:$("#first_day").val(), second_day:$("#second_day").val(), search_condition:$("#search_condition option:selected").val(), msgword:$("#msgword").val(), nowPage:nowPage},
    success: function(data){
      console.log(data); 
      var str=""; 
      if(data[0].msg_admin_list.length>0){
        for(var i=0; i<data[0].msg_admin_list.length; i++){  
          str+='<TR style="border: 0.3px solid #ddd;">'; 
          str+='<td><input type="checkbox" id="checked" data-msg_no='+data[0].msg_admin_list[i].msg_no+'></td>'; 
          str+='<td style="text-align: center ;">'+data[0].msg_admin_list[i].sender_id+'('+data[0].msg_admin_list[i].sender_name+')</td>';
          str+='<td style="text-align: center ;">'+data[0].msg_admin_list[i].receiver_id+'('+data[0].msg_admin_list[i].receiver_name+')</td>';
          str+='<td style="text-align: center ;">'+data[0].msg_admin_list[i].msg_title+'</td>';
          str+='<td style="text-align: center ;">'+data[0].msg_admin_list[i].msg_content+'</td>'; 
          str+='<td style="text-align: center ;">'+data[0].msg_admin_list[i].msg_date+'</td>';
          if(data[0].msg_admin_list[i].msg_recv_date==undefined){
            str+='<td style="text-align: center ;">미확인</td>';
          }else{
            str+='<td style="text-align: center ;">'+data[0].msg_admin_list[i].msg_rev_date+'</td>';
          }
          str+='</TR>';
        }
      }
        
      $("#cnt").text(data[1].msg_admin_count+"개");
      $("#msg_admin_tbody").html("");
      $("#msg_list_paging").html("");
      $("#msg_admin_tbody").html(str);
      $("#msg_list_paging").html(data[2].msg_admin_paging);
      
      $("#first_day").val(data[0].first_day);
      $("#second_day").val(data[0].second_day); 
      $("#msgword").val(data[0].msgword);
      
      /* for(var i=0; i<$("#search_condition option").length; i++){  
        // console.log($("#search_condition option:eq("+i+")").text());
        // ajax통신으로 넘어온 search_condition이 옵션 값에 일치하는게 있다면 if문 수행.
        // 
        if(data[0].search_condition==$("#search_condition").val()){  
          console.log($("#search_condition").val()); 
          //$("#search_condition option:eq("+i+")").attr("selected","selected"); 
        }
      } */ 
    },
    error: function (request, status, error){ 
      alert("AJAX 실패"); 
    }
  });
}



</script>

<body>
<jsp:include page="/menu/top.jsp" flush="false" />
<DIV class='container'> 
<DIV class='content' style="text-align: center;">

  <!-- 공통 모달창  -->
  <div class="modal fade" id="modal_common" role="dialog" style="display: none;">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h3 class="modal-title text-error" id='modal_title'>[관리자]쪽지 삭제</h3>
      </div>
       
      <div class="modal-body" id="modal-body">
        <span class="text-warning" style="font-size: 0.7em;">*해당 쪽지를 삭제하면 회원의 <span style="color: red; font-weight: bolder;">받은쪽지함/보낸쪽지함</span>에서도 삭제됩니다.</span><br>
      </div> 
      
      <div class="modal-footer" id="modal-footer">
        <button type="button" class="btn btn-info" onclick="message_del_admin();" data-dismiss="modal">삭제</button>
        <button type="button" class="btn btn-info" data-dismiss="modal">취소</button> 
      </div>
    </div> 
  </div> 
  <!-- 공통 모달 종료 -->
  
  <!-- 공통 탭 -->
  <DIV id="tab_bar" style="float: left;">
    <DIV style="margin: 0px auto; position: relative;"> 
      <a style="outline: none;" class="btn btn-xs tab_btn active" onclick="javascript:msg_list();"><span>쪽지함 관리자용</span></a> 
      <a style="outline: none; margin-left: -6px;" class="btn btn-xs tab_btn" onclick="javascript:msg_send_admin();"><span>관리자용 쪽지 통계</span></a>
    </DIV>  
  </DIV>
  
  <!-- 쪽지 리스트 출력 부분 -->
  <DIV id="msg_list" style="position: relative; border: 0.5px solid #eee; border-radius:10px; padding: 10px; clear:both;">
    <DIV id='tool_bar'>
      <DIV style="float: left; width: 20%;"> 
        <button class='btn btn-danger btn-xs' onclick="message_del_modal(); ">삭제</button> 
        <button class='btn btn-info btn-xs' onclick="msg_list_clear(); ">전체보기</button>
         
        <select id="paging_change" style="font-size: 10px; height: 25px; outline: none;">
          <option value="10">모아보기</option>
          <option value="1">1개씩 보기(test)</option>
          <option value="5">5개씩 보기</option>
          <option value="10">10개씩 보기(기본)</option>
          <option value="20">20개씩 보기</option>
          <option value="30">30개씩 보기</option>
        </select>
      </DIV>
       
      <DIV style="float: right; width: 80%; text-align: right;">
        <span style="float: left;">
          <label for="search_cnt" style="font-size: 10px;">조회 된 수:<span id="cnt"></span></label>
        </span>
        
        <select id="select_day" style="font-size: 10px; outline: none;">
          <option>기간선택</option>
          <option>Today</option> 
          <option>1 Week</option> 
          <option>1 Month</option>
        </select>
        
        <label for="first_day" style="font-size: 10px;">검색기간</label>
        <input id="first_day" name="first_day" style="font-size: 11px; margin-bottom: 0px; width: 105px;" type="date" value="">
        <span style="font-weight: bolder;">~</span> 
        <input id="second_day" name="second_day" style="font-size: 11px; margin-bottom: 0px; width: 105px;" type="date" value=""> 
        
        <select style="font-size: 10px; outline: none;" id='search_condition' name="search_condition">
          <option value="none">선택(조건)</option>
          <option value="search_id">아이디</option>
          <option value="msg_title">제목</option> 
          <option value="msg_content">내용</option>
        </select>
        
        <input class="form-search" style="margin-bottom: 0px; font-size: 10px;" type="text" id='msgword' name='msgword' value="" placeholder="쪽지검색">
        <button type="button" class='btn btn-link' style="font-size: 10px; padding-left: 0px;" onclick="msg_admin_list(); "><img src='./images/search.png'>검색</button>
      </DIV>
    </DIV>
    
    <DIV id="msg_list_table" style="clear:both;">
    
      <TABLE class='table table-striped' style='border-radius:10px;'>
        <colgroup id='list_colgroup'>
          <col style='width: 3%;'/>
          <col style='width: 8%;'/>
          <col style='width: 8%;'/>
          <col style='width: 13%;'/>
          <col style='width: 32%;'/>
          <col style='width: 12%;'/>
          <col style='width: 12%;'/>
        </colgroup>
        <thead style="font-size: 0.7em; border: 1px solid #ddd;">  
          <TR id='list_tr'>  
            <TH style='text-align: center ;'><input type="checkbox" id='all_check'></TH>
            <TH style='text-align: center ;'>보낸이</TH>
            <TH style="text-align: center ;">받는이</TH> 
            <TH style='text-align: center ;'>제목</TH>
            <TH style='text-align: center ;'>내용</TH>
            <TH style='text-align: center ;'>보낸날짜</TH>
            <TH style='text-align: center ;'>확인날짜</TH>
          </TR> 
        </thead>
        <tbody style="font-size: 0.7em;" id='msg_admin_tbody'>
        </tbody>
      </TABLE>
    </DIV>
    
    <DIV id="msg_list_paging">
    </DIV> 
  </DIV> 
  
  <!-- 통계 자료 --> 
  <DIV id="msg_send_admin" style="position: relative; border: 0.5px solid #eee; border-radius:10px; padding: 10px; clear:both; display: none;"> 
    <!-- 여기에 차트가 생성됩니다. -->
    <img id="test_img" style="display: none; width: 30%;" src="./images/test.jpg">
    <div id="chart_div"> 
    </div>
  </DIV> 
  
</DIV> <!-- content END -->
</DIV> <!-- container END -->
<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
</html>