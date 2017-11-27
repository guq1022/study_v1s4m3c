<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>

*{
color: #000000;
}
</style>

</head>

<script type="text/javascript">
$(function(){
  
  /* $("#area").show();
  $("#change_area > #seoul").show(); */
  
  $('#change_email').change(function(){
    $('#change_email option:selected').each(function() {
      if($(this).val() == 'self'){
        $('#email2').val('');
        $('#email2').attr("disabled", false);
      } else if ($(this).val == 'select'){
        $('#email2').val('');
        $('#email2').attr("disabled", false);
      } else {
        $('#email2').val($(this).text());
        $('#email2').attr("disabled", true);
      }
    });
  });
  
  var seoul=['동대문구', '종로구', '강남구'];
  var gu=["수원시", "광명시"];
  
  /* 홈페이지 시작 시 서울이 디폴트 */
  var li="";
  for(var i=0; i<seoul.length; i++){
    li+="<option value="+seoul[i]+">"+seoul[i]+"</option>";
  } 
  $("#selected_area").append(li);
  
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
      for(var i=0; i<gu.length; i++){
        li+="<option value="+gu[i]+">"+gu[i]+"</option>";
      }
      $("#selected_area").append(li);
    }
  });
});
  

</script>
    
<body>
<DIV class='container'>

<DIV class='content'>

<DIV class='title' style='width: 40%;'>스터디 그룹 등록</DIV>
 
<FORM name='frm' method='POST' action='./create.do'>
  <fieldset>
    <ul>
      <li class = 'li_none'>
        <label for='title'>제목 </label>
        <input type='text' name='title' id='title' value=''required="required" autofocus="autofocus" style='width:100%;'>
      </li>
         
      <li class = 'li_none'>
        <label for='topic'>분야</label>
          <select id="topic" name="topic" title='직접선택'>
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
              <option value="그외">"그외"</option>
            </optgroup>
          </select>
      </li>
      
      <li class = 'li_none'>
         <label for='email'>이메일 </label>
          <input type="text" id="email1" name="email1" style="width:100px;" value="" maxlength="20" title="이메일 아이디" /> @
          <input type="text" id="email2" name="email2" style="width:100px;" value="" maxlength="20" title="이메일 아이디" />
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
      
      <li class = 'li_none' id="change_area">
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
          
          <select id="selected_area" name="selected_area" title="선택한 하위 지역">
            <!-- 선택한 지역의 하위 지역 -->
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
        <label for='tot_num'>구성원수</label>
          <input type ='number' name='tot_num' id='tot_num' min='4' max='10' step='1'>
     </li>
      <li class = 'li_none'>
        <label for='content'>내용</label>
         <textarea rows='20' cols='500' name='content' id='content' style='width:100%;'></textarea>
      </li>
 
      <li class='li_right'>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='./studylist.do'">목록</button>
      </li>         
    </ul>
  </fieldset>
</FORM>
 

</DIV> <!-- content END -->


</DIV> <!-- container END -->
</body>
</html>