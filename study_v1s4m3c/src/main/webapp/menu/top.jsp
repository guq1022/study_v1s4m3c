<%@ page contentType="text/html; charset=UTF-8" %>

<%
  String root = request.getContextPath();
%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<!-------------------------- ROBOTO FONT Part -------------------------->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700&amp;subset=latin,latin-ext'  rel='stylesheet' type='text/css'>
<!-------------------------- CSS Part -------------------------->
<link rel="stylesheet" type="text/css" href="<%=root%>/menu/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="<%=root%>/menu/css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="<%=root%>/menu/css/style.css" />
<link rel="stylesheet" type="text/css" href="<%=root%>/menu/css/pluton.css" />
<link rel="stylesheet" type="text/css" href="<%=root%>/menu/css/jquery.cslider.css" />
<link rel="stylesheet" type="text/css" href="<%=root%>/menu/css/jquery.bxslider.css" />
<link rel="stylesheet" type="text/css" href="<%=root%>/menu/css/animate.css" />
<!-- Fav And Touch icons Part -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
  href="<%=root%>/menu/images/ico/apple-touch-icon-144.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
  href="<%=root%>/menu/images/ico/apple-touch-icon-114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
  href="<%=root%>/menu/images/apple-touch-icon-72.png">
<link rel="apple-touch-icon-precomposed"
  href="<%=root%>/menu/images/ico/apple-touch-icon-57.png">
<link rel="shortcut icon" href="<%=root%>/menu/images/ico/favicon.ico">
</head>

<body>

<!---------------------상단 Aside 메뉴 시작-------------------------->
  <div style="text-align: right; margin: 10px; color: #333333; font-size: 15px;">
    <a href="#">회원가입</a>
    <a href="#">로그인</a>
    <a href="#">[로그아웃]</a>
    <span style="font-weight: bold;"> 홍길동 님의
    <a href="#">My Page</a></span>
  </div>
  <!--------------------------상단 Aside 메뉴 시작-------------------------->

  <div class="navbar">
    <div class="navbar-inner">
      <div class="container">
      
        <!-------------------------- 웹사이트 로고 부분 시작 -------------------------->
        <a href="./index.jsp" class="brand"> <img src="<%=root%>/menu/images/Logo.png" 
        width="400px" height="150" alt="Logo" /> 
        </a>
        <!-------------------------- 웹사이트 로고 부분 종료 -------------------------->
        
        <!-------------------------- Navigation button -------------------------->
        <button type="button" class="btn btn-navbar"
          data-toggle="collapse" data-target=".nav-collapse">
          <i class="icon-menu"></i>
        </button>
        <!------------------------------------------------------------------------->
        
        <!-------------------------- 웹사이트 메인 메뉴 부분 시작 ------------------------ -->
        <div class="nav-collapse collapse pull-right">
          <ul class="nav" id="top-navigation">

            <!-- <Menu1> 내 스터디 -->
            <li class="dropdown">
              <a href="/study/mystudy/mystudy.do">내스터디</a>
            </li>
           
            <!-- <Menu2> 스터티그룹 찾기 -->
            <li><a href="/study/studylist/list.do">스터디그룹 찾기</a></li>
            
            <!-- <Menu3> 스터디룸 찾기 -->
            <li><a href="#">스터디룸 찾기</a></li>
            
            <!-- <Menu4> 공모전 / 취업 -->
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">공모전/취업<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">공모전</a></li>
                <li><a href="#">취업</a></li>
                <li><a href="#">후기</a></li>
              </ul>
            </li>
            
            <!-- <Menu5> 커뮤니티 -->
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">커뮤니티<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">자유게시판</a></li>
                <li><a href="#">중고판매</a></li>
                <li><a href="#">자료실</a></li>
              </ul>
            </li>
            
            <!-- <Menu6> 공지사항 -->
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">공지사항<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">공지사항</a></li>
                <li><a href="#">Q&A</a></li>
              </ul>
            </li>
            
          </ul>
        </div>
        <!-------------------------- 웹사이트 메인 메뉴 부분 종료 --------------------------> 
        
      </div>
    </div>
  </div>
  

<!-------------------------- Javascript 관련 Include -------------------------->
  <script src="<%=root%>/menu/js/jquery.js"></script>
  <script type="text/javascript" src="<%=root%>/menu/js/jquery.mixitup.js"></script>
  <script type="text/javascript" src="<%=root%>/menu/js/bootstrap.js"></script>
  <script type="text/javascript" src="<%=root%>/menu/js/modernizr.custom.js"></script>
  <script type="text/javascript" src="<%=root%>/menu/js/jquery.bxslider.js"></script>
  <script type="text/javascript" src="<%=root%>/menu/js/jquery.cslider.js"></script>
  <script type="text/javascript" src="<%=root%>/menu/js/jquery.placeholder.js"></script>
  <script type="text/javascript" src="<%=root%>/menu/js/jquery.inview.js"></script>
  <script type="text/javascript" src="<%=root%>/menu/js/bootstrap-hover-dropdown.js"></script>
  <script type="text/javascript" src="<%=root%>/menu/js/bootstrap-hover-dropdown.min.js"></script>
  <!-- Load google maps api and call initializeMap function defined in app.js -->
  <!-- css3-mediaqueries.js for IE8 or older -->
  <script type="text/javascript" src="<%=root%>/menu/js/app.js"></script>

</body>
</html>