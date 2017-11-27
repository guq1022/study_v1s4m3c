<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>

<style>

*{
color: #000000;
}

</style>

<body>
<jsp:include page="../menu/top.jsp" flush='false' />
<DIV class='container'>
<DIV class='content'>

<table class="table table-hover">
    <thead>
      <tr>
        <th>모집번호</th>
        <th>회원이름</th>
        <th>성별</th>
        <th>이메일</th>
        <th>승인여부</th>
        <th>권한</th>
        <th>스터디 번호</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="recruit_list" items="${recruit_list}">
 
  
      <tr>
        <td>${recruit_list.recruitno} </td>
        <td>${recruit_list.memname}</td>
        <td>${recruit_list.memgender}</td>
        <td>${recruit_list.mememail}</td>
        <td>${recruit_list.confirm}</td>
        <td>${recruit_list.std_auth}</td>
        <td>${recruit_list.stdlist_no}</td>
    
      </tr>      
   

      </c:forEach>
   </tbody>
 </table>


</DIV> <!-- content END -->
</DIV> <!-- container END -->
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>