<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<% 
String root = request.getContextPath(); // 절대 경로 지정
%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Study Matching Web Site</title>

<link href="./css/my_study_style.css" rel='Stylesheet' type='text/css'>

<!-------------------------- Web Logo Part -------------------------->
<link rel="shortcut icon" href="<%=root%>/menu/images/ico/Short Logo.png">
<!---------------------------------------------------------------------->
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<script type="text/javascript" src="../js/jquery.cookie.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  
  $("tbody > tr").mouseover(function(){
    $("td", this).css("background-color", "rgb(222, 213, 213)");
    $("td", this).css("cursor", "pointer");
  });
  
  $("tbody > tr").mouseout(function(){
    $("td", this).css("background-color", "#ffffff");
  });
  
  /* 쿠키를 select 할 때는 #을 사용한다.
  아이디를 이용해 태그를 검색하는 것과 동일하다.
  
  값을 대입할 때도 val() 함수를 사용한다. (동일함)
  */
  
  $.cookie('pdsword1', '', {path:'/'}); // Cookie 생성
  $.cookie('pdsword2', '', {path:'/'}); // Cookie 생성
  $.cookie('pdsword3', '', {path:'/'}); // Cookie 생성
  
  $.cookie('nowpage', 1, {path:'/'}); // 현재 페이지 저장 cookie
  $.cookie('nowpage2', 1, {path:'/'}); // 현재 페이지 저장 cookie
  $.cookie('nowpage3', 1, {path:'/'}); // 현재 페이지 저장 cookie 
   
}); 
 
function load(stdlist_no){
  location.href="/study/mystudy/mystudy_space.do?stdlist_no="+stdlist_no+"&cateno=2";
}

</script>
<body>
<jsp:include page="/menu/top.jsp" flush="false" />
<DIV class='container'>
<DIV class="content">
  <DIV style="text-align: center;"> 
    <h2 style="font-weight: bolder;">내가 참여 중인 스터디 현황</h2>
    <hr style="color: #000000; border: solid 2px #000000; clear: both;">
  </DIV>
  <!-- 내가 참여중인 스터디 내역 -->
  <DIV class="well well-xs" style="border: solid 1px #000000; margin-top: 1%; height: 50%;">
    <DIV>
      <button style="float: right; margin-bottom: 10px;" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">내 신청 현황</button>
    </DIV>
    <c:set var="mystudylist" value="${mystudylist}"/>
    <c:choose>
      <c:when test="${fn:length(mystudylist) == 0}">
        <h1>참여중인 스터디가 없습니다.</h1>
        <button onclick="location.href='/study/studylist/create.do'">스터디 참여하러 가기</button>
      </c:when>
      <c:when test="${fn:length(mystudylist) != 0}">
        <TABLE class='table table-striped' style="margin-top: 1%;">
          <colgroup>
            <col style='width: 20%;'/>
            <col style='width: 10%;'/>
            <col style='width: 20%;'/>
            <col style='width: 10%;'/>
            <col style='width: 10%;'/>
            <col style='width: 10%;'/>
            <col style='width: 20%;'/>
          </colgroup> 
         
          <thead>
            <TR class="label-success">
              <TH style='text-align: center ;'>스터디 이름</TH>
              <TH style='text-align: center ;'>주제</TH>
              <TH style='text-align: center ;'>활동지역</TH>
              <TH style='text-align: center ;'>모임일</TH>
              <TH style='text-align: center ;'>모임시간</TH>
              <TH style='text-align: center ;'>팀장명</TH>
              <TH style='text-align: center ;'>참여한 날짜</TH>
            </TR>
          </thead>
          
          <!-- 컨트롤러에서 mav객체에 list를 추가하지 않아도 여기서 에러 발견 x -->
          <tbody id="meminfo_tbody">
            <c:forEach var="mystudylist" items="${mystudylist}">
            <tr id="info" onclick="load('${mystudylist.stdlist_no}')">
              <td style='text-align: center;'>${mystudylist.stdlist_title}</td>
              <td style='text-align: center;'>${mystudylist.stdlist_topic}</td>
              <td style='text-align: center;'>${mystudylist.stdlist_area }</td>
              <td style='text-align: center;'>${mystudylist.stdlist_time}</td>
              <td style='text-align: center;'>${mystudylist.stdlist_dow}</td>
              <td style='text-align: center;'>홍길동</td>
              <td style='text-align: center;'>${mystudylist.stdlist_date}</td>
            </tr>
            </c:forEach>
          </tbody>
        </TABLE>
      </c:when>
    </c:choose>
  </DIV>
  
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog" style="display: none;">
    <!-- Modal content--> 
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <h3>Some text in the modal.</h3>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div> 
  
  <DIV style="text-align: center;">
    <DIV class="well well-xs" style="border: solid 1px #000000; margin-top: 1%; width: 46.4%; height:200px; display:inline-block;">
      <h1>공모전 요약 정보들</h1>
    </DIV>
    
    <DIV class="well well-xs" style="border: solid 1px #000000; margin-top: 1%; width: 46.4%; height:200px; display: inline-block;">
      <h1>취업정보 요약 정보들</h1>
    </DIV>
  </DIV>
  
</DIV> <!-- content END -->
</DIV> <!-- container END -->
<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
</html>