<%@ page contentType="text/html; charset=UTF-8" %>

<% 
String root = request.getContextPath(); // 절대 경로 지정
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
<body>
<jsp:include page="../menu/top.jsp" flush="false" />
<DIV class='container'>
<DIV class='content'>

  <DIV style="color: #000000;">
    <br>test입니다.<br>
    test입니다.<br>
    test입니다.<br>
    test입니다.<br>
    test입니다.<br>
    test입니다.<br>
    test입니다.<br>
    test입니다.<br>
    test입니다.<br>
    test입니다.<br>
    test입니다.<br>
    test입니다.<br>
    test입니다.<br>
    test입니다.<br>
 
    <br>
  </DIV>
    
</DIV> <!-- content END -->
</DIV> <!-- container END -->
<jsp:include page="../menu/bottom.jsp" flush="false" />
</body>
</html>