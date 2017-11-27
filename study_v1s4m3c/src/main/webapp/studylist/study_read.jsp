<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    
    <!-- 합쳐지고 최소화된 최신 CSS -->
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    부가적인 테마
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    합쳐지고 최소화된 최신 자바스크립트
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

<style>

*{
color: #000000;
}

</style>

</head>
<script type="text/javascript">

$(function(){
  
})

</script>

<body>
<jsp:include page="../menu/top.jsp" flush='false' />

<DIV class='container'>
<DIV class='content'>
  
  <fieldset class='fieldset_basic'>
   <ul>
     <li class='li_none'>
    
      <label for = 'stdlist_title'>제목</label>
        <div>
          <span>${ read.stdlist_title} </span>
        </div> 
        
      <label for = 'stdlist_topic'>분야</label>    
        ${ read.stdlist_topic} 
        
      <label for = 'stdlist_area'>지역</label>    
        ${ read.stdlist_time} 
        
      <label for = 'stdlist_time'>시간</label>    
        ${ read. stdlist_time} 
        
      <label for = 'stdlist_dow'>요일</label>    
        ${ read. stdlist_dow} 
        
    </li>
    <li class='li_none'>
      <label for = 'stdlist_content'>내용</label>    
        ${ read. stdlist_content} 
    </li>
    
  </ul>
  <ul>
     <li class='li_none'>
      <label for = 'memname'>이름</label>    
        ${ read. memname} 
    </li>
     <li class='li_none'>
      <label for = 'mememail'>이메일</label>    
        ${ read. mememail} 
    </li>
     <li class='li_none'>
      <label for = 'memphone'>핸드폰번호</label>    
        ${ read. memphone} 
        <br>
       <a href='/study/recruit/recruit_list.do?stdlist_no=${read.stdlist_no}'> 신청 리스트</a>
    </li>
  
  
  
    <li class='li_center'>
      <button type='button' id='join'>신청하기</button>
    </li>
 
   </ul>
  </fieldset>
  
</DIV> <!-- content END -->
</DIV> <!-- container END -->
 <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>