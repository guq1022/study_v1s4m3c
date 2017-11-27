<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="./css/style.css" rel='Stylesheet' type='text/css'>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    

<style>


</style>

</head>

<script type="text/javascript">
$(function(){
  
  $('#change_email').change(function(){
    $('#change_email option:selected').each(function() {
      if($(this).val() == 'self'){
        $('#email2').val('');
        $('#email2').attr("disabled", false);
      } else {
        $('#email2').val($(this).val());
        $('#email2').attr("disabled", false);
      }
    });
  });
 

  
    var list=['서울', '경기', '인천', '강원', '경남', '경북', '광주', '대구', '대전', '부산', '세종', '울산', '전남', '전북', '제주', '충남', '충북'];
    
    var seoul =['강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구'];
    var gyeonggi =['가평군', '고양시덕양구', '고양시일산동구', '고양시일산서구', '과천시', '광명시', '광주시', '구리시', '군포시', '김포시', '남양주시', '동두천시', '부천시소사구', '부천시오정구', '부천시원미구', '성남시분당구', '성남시수정구', '성남시중원구', '수원시권선구', '수원시장안구', '수원시팔달구', '시흥시', '안산시단원구', '안산시상록구', '안성시', '안양시동안구', '안양시만안구', '양주시', '양평군', '여주군', '연천군', '오산시', '용인시기흥구', '용인시수지구', '용인시처인구', '의왕시', '의정부시', '이천시', '파주시', '평택시', '포천시', '하남시', '화성시'];
    var incheon = ['강화군', '계양구', '남구', '남동구', '동구', '부평구', '서구', '연수구', '옹진군', '중구'];
    var kangwon = ['고성군', '동해시', '삼척시', '속초시', '양구군', '양양군', '영월군', '원주시', '인제군', '정선군', '철원군', '춘천시', '태백시', '평창군', '홍천군', '화천군', '횡성군'];
    var gyeongnam = ['거제시', '거창군', '고성군', '김해시', '남해군', '밀양시', '사천시', '산청군', '양산시', '의령군', '진주시', '창녕군', '창원시', '마산합포구', '창원시', '마산회원구', '창원시', '성산구', '창원시', '의창구', '창원시', '진해구', '통영시', '하동군', '함안군', '함양군', '합천군'];
    var gyeongbuk = ['경산시', '경주시', '고령군', '구미시', '군위군', '김천시', '문경시', '봉화군', '상주시', '성주군', '안동시', '영덕군', '영양군', '영주시', '영천시', '예천군', '울릉군', '울진군', '의성군', '청도군', '청송군', '칠곡군', '포항시남구', '포항시북구'];
    var gwangju =['광산구', '남구', '동구', '북구', '서구'];
    var daegu = ['남구', '달서구', '달성군', '동구', '북구', '서구', '수성구', '중구'];
    var daejeon = ['대덕구', '동구', '서구', '유성구', '중구'];
    var busan = ['강서구', '금정구', '기장군', '남구', '동구', '동래구', '부산진구', '북구', '사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구', '해운대구'];
    var sejong = ['세종시'];
    var ulsan = ['남구', '동구', '북구', '울주군', '중구'];
    var jeonnam = ['강진군', '고흥군', '곡성군', '광양시', '구례군', '나주시', '담양군', '목포시', '무안군', '보성군', '순천시', '신안군', '여수시', '영광군', '영암군', '완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군'];
    var jeonbuk = ['고창군', '군산시', '김제시', '남원시', '무주군', '부안군', '순창군', '완주군', '익산시', '임실군', '장수군', '전주시', '덕진구', '전주시', '완산구', '정읍시', '진안군'];
    var jeju = ['서귀포시', '제주시'];
    var chungnam = ['계룡시', '공주시', '금산군', '논산시', '당진시', '보령시', '부여군', '서산시', '서천군', '아산시', '예산군', '천안시동남구', '천안시서북구', '청양군', '태안군', '홍성군'];
    var chungbuk = ['괴산군', '단양군', '보은군', '영동군', '옥천군', '음성군', '제천시', '증평군', '진천군', '청원군', '청주시', '상당구', '청주시', '흥덕구', '충주시'];
    
    /* 홈페이지 시작 시 서울이 디폴트 */
    
   

      var li="";
      for(var i=0; i<seoul.length; i++){
        li+="<option value="+seoul[i]+">"+seoul[i]+"</option>";
      }
      $("#selected_area").append(li);  /* 목표 태그안에 삽입 */
    
    
    $('#area').change(function(){
      var li="";
      /* 서울이 선택되었을 때. */
      /* 처음 시작은 서울임. */
      if($("#area").val()=="서울"){
        $("#selected_area").empty(); /* 태크안의 내용을 삭제. */
        for(var i=0; i<seoul.length; i++){
          li+="<option value="+seoul[i]+">"+seoul[i]+"</option>";
        }
        $("#selected_area").append(li);  /* 목표 태그안에 삽입 */
      }else if($("#area").val()=="경기"){
        $("#selected_area").empty();
        for(var i=0; i<gyeonggi.length; i++){
          li+="<option value="+gyeonggi[i]+">"+gyeonggi[i]+"</option>";
        }
        $("#selected_area").append(li);
      }else if($("#area").val()=="인천"){
        $("#selected_area").empty();
        for(var i=0; i<incheon.length; i++){
          li+="<option value="+incheon[i]+">"+incheon[i]+"</option>";
        }
        $("#selected_area").append(li);
      }else if($("#area").val()=="강원"){
        $("#selected_area").empty();
        for(var i=0; i<kangwon.length; i++){
          li+="<option value="+kangwon[i]+">"+kangwon[i]+"</option>";
        }
        $("#selected_area").append(li);
      }else if($("#area").val()=="경남"){
        $("#selected_area").empty();
        for(var i=0; i<gyeongnam.length; i++){
          li+="<option value="+gyeongnam[i]+">"+gyeongnam[i]+"</option>";
        }
        $("#selected_area").append(li);
      }else if($("#area").val()=="경북"){
        $("#selected_area").empty();
        for(var i=0; i<gyeongbuk.length; i++){
          li+="<option value="+gyeongbuk[i]+">"+gyeongbuk[i]+"</option>";
        }
        $("#selected_area").append(li);
      }else if($("#area").val()=="광주"){
        $("#selected_area").empty();
        for(var i=0; i<gwangju.length; i++){
          li+="<option value="+gwangju[i]+">"+gwangju[i]+"</option>";
        }
        $("#selected_area").append(li);
      }else if($("#area").val()=="대구"){
        $("#selected_area").empty();
        for(var i=0; i<daegu.length; i++){
          li+="<option value="+daegu[i]+">"+daegu[i]+"</option>";
        }
        $("#selected_area").append(li);
      }else if($("#area").val()=="대전"){
        $("#selected_area").empty();
        for(var i=0; i<daejeon.length; i++){
          li+="<option value="+daejeon[i]+">"+daejeon[i]+"</option>";
        }
        $("#selected_area").append(li);
      }else if($("#area").val()=="세종"){
        $("#selected_area").empty();
        for(var i=0; i<sejong.length; i++){
          li+="<option value="+sejong[i]+">"+sejong[i]+"</option>";
        }
        $("#selected_area").append(li);
      }else if($("#area").val()=="울산"){
        $("#selected_area").empty();
        for(var i=0; i<ulsan.length; i++){
          li+="<option value="+ulsan[i]+">"+ulsan[i]+"</option>";
        }
        $("#selected_area").append(li);
      }else if($("#area").val()=="전남"){
        $("#selected_area").empty();
        for(var i=0; i<jeonnam.length; i++){
          li+="<option value="+jeonnam[i]+">"+jeonnam[i]+"</option>";
        }
        $("#selected_area").append(li);
      }else if($("#area").val()=="전북"){
        $("#selected_area").empty();
        for(var i=0; i<jeonbuk.length; i++){
          li+="<option value="+jeonbuk[i]+">"+jeonbuk[i]+"</option>";
        }
        $("#selected_area").append(li);
      }else if($("#area").val()=="제주"){
        $("#selected_area").empty();
        for(var i=0; i<jeju.length; i++){
          li+="<option value="+jeju[i]+">"+jeju[i]+"</option>";
        }
        $("#selected_area").append(li);
      }else if($("#area").val()=="충남"){
        $("#selected_area").empty();
        for(var i=0; i<chungnam.length; i++){
          li+="<option value="+chungnam[i]+">"+chungnam[i]+"</option>";
        }
        $("#selected_area").append(li);
      }else if($("#area").val()=="충북"){
        $("#selected_area").empty();
        for(var i=0; i<chungbuk.length; i++){
          li+="<option value="+chungbuk[i]+">"+chungbuk[i]+"</option>";
        }
        $("#selected_area").append(li);
      }
    });

  });

  </script>
    
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
<DIV class='container'>

<DIV class='content'>

<DIV class='menu_line' ><h2>스터디 그룹 등록</h2></DIV>
 
<FORM name='frm' method='POST' action='./create.do'>
  <input type='hidden' name='memberno' id='memberno' value='1'>
  
  <fieldset>
    <ul>
      <li class = 'li_none'>
        <label for='stdlist_title'>제목 </label>
        <input type='text' name='stdlist_title' id='stdlist_title' value=''required="required" autofocus="autofocus" style='width:100%;'>
      </li>
     <li class = 'li_none'>
         <label for='email'>이메일 </label>
          <input type="text" id="email1" name="email1" style="width:100px;" value="" maxlength="20" title="이메일 아이디" /> @
          <input type="text" id="email2" name="email2" style="width:100px;" value="" maxlength="20" title="이메일주소" />
          <select name="change_email" id="change_email" title="직접선택" style="width:160px;">
            <option value="self">직접입력</option>
            <option value="naver.com">naver.com</option>
            <option value="hanmail.net">hanmail.net</option>
            <option value="nate.com">nate.com</option>
            <option value="daum.net">daum.net</option>
            <option value="paran.com">paran.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="hotmail.com">hotmail.com</option>
            <option value="yahoo.co.kr">yahoo.co.kr</option>
            <option value="empal.com">empal.com</option>
            <option value="lycos.co.kr">lycos.co.kr</option>
            <option value="korea.com">korea.com</option>
            <option value="dreamwiz.com">dreamwiz.com</option>
            <option value="freechal.com">freechal.com</option>
          </select>
      </li>         
         
      <li class = 'li_none'>
        <label for='stdlist_topic'>분야</label>
          <select id="stdlist_topic" name="stdlist_topic" title='직접선택'>
            <option selected disabled>직접선택</option>
            <optgroup label="-- IT --">
              <option value="데이터베이스">데이터베이스</option>
              <option value="웹개발">웹개발</option>
              <option value="공모전">공모전</option>
              <option value="PROJECT">PROJECT</option>
            </optgroup>
             <optgroup label="-- 자격증 --">
              <option value="IT관련">IT관련</option>
              <option value="디자인관련">디자인관련</option>
              <option value="국가기능">국가기능</option>
            </optgroup>
            <optgroup label="-- 어학 --">
              <option value="토익">토익</option>
              <option value="토플">토플</option>
              <option value="외국어관련">외국어관련</option>
            </optgroup>
            <optgroup label="-- 기타 --">
              <option value="그외">그외</option>
            </optgroup>
          </select>
      </li>
      
      <li class = 'li_none'>
        <label for='area'>지역</label>
          <select id="area" name="area" title='직접선택' >
            <option value="서울">서울</option>
            <option value="경기">경기</option>
            <option value="인천">인천</option>
            <option value="강원">강원</option>
            <option value="경남">경남</option>
            <option value="경북">경북</option>
            <option value="광주">광주</option>
            <option value="대구">대구</option>
            <option value="대전">대전</option>
            <option value="부산">부산</option>
            <option value="세종">세종</option>
            <option value="울산">울산</option>
            <option value="전남">전남</option>
            <option value="전북">전북</option>
            <option value="제주">제주</option>    
            <option value="충남">충남</option>
            <option value="충북">충북</option>
          </select>
          
          <select id="selected_area" name="selected_area" title='selected_area'>
           <!-- 선택한 지역의 하위 지역  -->
          </select>
          
      </li>
      
      <li class = 'li_none'>
        <label for='dow'>요일</label>
          <input type="checkbox" name='dow1' id='dow1' value='월'>월 &nbsp;&nbsp;
          <input type="checkbox" name='dow2' id='dow2' value='화'>화 &nbsp;&nbsp;
          <input type="checkbox" name='dow3' id='dow3' value='수'>수 &nbsp;&nbsp;
          <input type="checkbox" name='dow4' id='dow4' value='목'>목 &nbsp;&nbsp;
          <input type="checkbox" name='dow5' id='dow5' value='금'>금 &nbsp;&nbsp;
          <input type="checkbox" name='dow6' id='dow6' value='토'>토 &nbsp;&nbsp;
          <input type="checkbox" name='dow7' id='dow7' value='일'>일     
      </li>
      
      <li class = 'li_none'>
        <label for='stdlist_time'>시간</label>
          <input type="text" name='stdlist_time' id='stdlist_time' value='오전'>
      </li>
      
      <li class = 'li_none'>
        <label for='stdlist_tot_num'>구성원수</label>
          <input type ='number' name='stdlist_tot_num' id='stdlist_tot_num' min='4' max='10' step='1' value='4'>
     </li>
      <li class = 'li_none'>
        <label for='stdlist_content'>내용</label>
         <textarea rows='20' cols='500' name='stdlist_content' id='stdlist_content' style='width:100%;'></textarea>
      </li>
 
      <li class='li_center'>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='./studylist.do'">목록</button>
      </li>         
    </ul>
  </fieldset>
</FORM>
 

</DIV> <!-- content END -->


</DIV> <!-- container END -->
 <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>