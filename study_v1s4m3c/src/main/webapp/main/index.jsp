<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String root = request.getContextPath();

//isNew() 메서드를 이용해 최초세션설정을 확인하고 있다.
/* if(session.isNew()) {
out.println("<script> alert(‎'새로운 세션이 시작 되었습니다.') </script>");
} */
%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Study Matching Web Site</title>

<!-------------------------- ROBOTO FONT Part -------------------------->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700&amp;subset=latin,latin-ext'  rel='stylesheet' type='text/css'>
<!-------------------------- CSS Part -------------------------->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/pluton.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.cslider.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.bxslider.css" />
<link rel="stylesheet" type="text/css" href="css/animate.css" />
<!-------------------------- Web Logo Part -------------------------->
<link rel="shortcut icon" href="images/ico/Short Logo.png">
</head>
<script type="text/javascript">


</script>
<body>

   <!---------------------상단 Aside 메뉴 시작-------------------------->

  <div style="text-align: right; margin: 10px; color: #333333; font-size: 15px;">
     <div style="float: left; text-align: left; color: #333333; font-size: 15px;">
       오늘 방문자 : ${sessionScope.todayCount}<span style='margin:5px;'>|</span>전체 방문자 : ${sessionScope.totalCount}
      <c:choose>
        <c:when test="${sessionScope.memauth == 'U' || sessionScope.admauth == 'M' || sessionScope.admauth == 'A'}">
        <span style='margin:5px;'>|</span>로그인 시간 : ${sessionScope.login_time}
        </c:when>
      </c:choose>
     </div>
  
<%-- 0. login 세션의 설정값 : <FONT COLOR=BLUE><%= session.getAttribute("memid") %></font> 님의 세션 유지<BR>
1. 세션 ID : <FONT COLOR=BLUE><%= session.getId() %></font> <BR>
2. 세션 유지시간(최초요청:톰켓 디폴트 1800초/두번째요청:아래설정값 나타남 10초/10초 지나면 다시 서버 디폴트 값 적용) :<FONT
COLOR=BLUE> <%= session.getMaxInactiveInterval() %></font> <BR>
3. 세션 유지시간 다시 설정 :<FONT COLOR=red> session.setMaxInactiveInterval(10)</font><==세션 인터벌 10초 재지정 <BR>
<%
session.setMaxInactiveInterval(10);
%>
4. login 세션의 재설정(같은 이름을"login" 주면 덮어쓰기 됩니다.) :<FONT COLOR=red> session.setAttribute("login",session.getId())</font> <==세션 아이디 저장<BR>
5. login 세션의 재설정값 : <FONT COLOR=BLUE><%= session.getAttribute("memid") %></font> 님의 세션 유지(세션아이디 값) <BR>
 --%>
    <c:choose>
      <c:when test="${sessionScope.memauth == 'U'}">
        <a href="<%=root%>/nonuser/login/logout.do">로그아웃  </a>
        <span style='margin:5px;'>|</span>
        <span style="font-weight: bold;"><img src='<%=root%>/jeimages/mypage.png' style='margin-right:5px;'>${sessionScope.memid } 님의
        <a href="<%=root%>/user/member/mem_read.do?memberno=${sessionScope.memberno}">My Page</a></span>
        <span style='margin:5px;'>|</span> 
        <a href='${pageContext.request.contextPath }/user/message/message_home.do'><img src='<%=root%>/jeimages/message.png' style='margin-right:5px;'>쪽지함</a>
      </c:when>              
      <c:when test="${sessionScope.admauth == 'M' || sessionScope.admauth == 'A'}">
        <a href="<%=root%>/nonuser/login/admin_logout.do">로그아웃  </a>
        <span style='margin:5px;'>|</span>
        <span style="font-weight: bold;"><img src='<%=root%>/jeimages/mypage.png' style='margin-right:5px;'>${sessionScope.admid } 님의
        <a href="<%=root%>/admin/admin/admin_read.do?adminno=${sessionScope.adminno}">My Page</a></span>
      </c:when> 
      <c:otherwise> 
        <a href="<%=root%>/nonuser/login/login.do">로그인</a>
        <span style='margin:5px;'>|</span>
        <a href="<%=root%>/nonuser/login/memberjoin.do">회원가입</a> 
      </c:otherwise>      
    </c:choose>
  </div>
  <!--------------------------상단 Aside 메뉴 시작-------------------------->

  <div class="navbar">
    <div class="navbar-inner">
      <div class="container">
      
        <!-------------------------- 웹사이트 로고 부분 시작 -------------------------->
        <a href="./index.do" class="brand"> <img src="images/Logo.png" 
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

          <c:choose>
            <c:when test="${sessionScope.memauth == 'U'}">
            <!-- <Menu1> 내 스터디 -->
            <li><a href="${pageContext.request.contextPath }/user/mystudy/mystudy.do">내 스터디</a></li>
            </c:when>
          </c:choose>
           
            <!-- <Menu2> 스터티그룹 찾기 -->
            <li><a href="<%=root %>/nonuser/studylist/list.do ">스터디 그룹</a></li>
            
            <!-- <Menu3> 스터디룸 찾기 -->
            <li><a href="<%=root %>/nonuser/room/list.do ">스터디룸</a></li>
            
            <!-- <Menu4> 공모전 / 취업 -->
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">공모전/취업<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="<%=root %>/nonuser/contest/list_all_contest.do">공모전</a></li>
                <li><a href="<%=root %>/nonuser/jobinfo/list_all_jobinfo.do">취업</a></li>

              </ul>
            </li>
            
            <!-- <Menu5> 커뮤니티 -->
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">커뮤니티<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="${pageContext.request.contextPath}/nonuser/free/list.do">자유 게시판</a></li>
                <li><a href="${pageContext.request.contextPath}/user/sale/list.do">거래 게시판</a></li>
                <li><a href="${pageContext.request.contextPath}/user/shared/list.do"> 자료실 </a></li>
              </ul>
            </li>
            
            <!-- <Menu6> 공지사항 -->
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">공지사항<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="<%=root%>/nonuser/notice/notice_list.do">공지사항</a></li>
                <li><a href="<%=root %>/nonuser/qnaboard/list_all_qna.do">Q & A</a></li>
              </ul>
            </li>
            
            <!-- <Menu7> 관리자 -->
        <c:choose>
          <c:when test='${sessionScope.admauth == "A"}'>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="<%=root%>/admin/categrp/grp_list.do">카테그룹</a></li>
                <li><a href="<%=root%>/admin/member/mem_list.do">회원 관리</a></li>
              </ul>
            </li>
          </c:when>
          <c:when test='${sessionScope.admauth == "M"}'>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="<%=root%>/admin/member/mem_list.do">회원 관리</a></li>
                <li><a href="<%=root%>/master/admin_list.do">관리자 관리</a></li>
                <li><a href="<%=root%>/admin/message/message_admin.do">쪽지함 관리</a></li>
              </ul>
            </li>
          </c:when>
        </c:choose>
                    
          </ul>
        </div>
        <!-------------------------- 웹사이트 메인 메뉴 부분 종료 --------------------------> 
        
      </div>
    </div>
  </div>
  
  <!-------------------------- 배너(Home) Section 시작 -------------------------->
  <div id="home">
    <!-------------------------- Slider Images 부분 시작 -------------------------->
    <div id="da-slider" class="da-slider">
      <div class="triangle"></div>
      <!-- mask elemet use for masking background image -->
      <div class="mask"></div>
      <!-- All slides centred in container element -->
      <div class="container">
        <!-------------------------- First Slider 부분 시작 -------------------------->
        <div class="da-slide">
          <h2 class="fittext2">Customer Search System</h2>
          <h4>사용자를 위한 맞춤형 스터디 그룹 검색</h4>
          <p>Study Desk 에서는 맞춤형 검색 서비스를 제공하여 사용자가 원하는<br>
             Study 모임에 대하여 주제와 지역별로 검색할 수 있습니다! <br>
             지금 바로 스터디 모임을 검색해보세요!</p>
          <a href="<%=root %>/nonuser/studylist/list.do " class="da-link button">더보기</a>  
          <div class="da-img">
            <img src="images/Slider01.png" alt="image01" width="240">
          </div>
        </div>
        <!-------------------------- First Slider 부분 종료 -------------------------->
        
        <!-------------------------- Second Slider 부분 시작 -------------------------->
        <div class="da-slide">
          <h2>Study Room Information</h2>
          <h4>스터디룸에 대한 정보 서비스 제공</h4>
          <p>스터디를 할 공간을 찾기 어려우신가요? Study Desk는 사용자를 위해<br>
               스터디룸 정보를 제공해 드리고 있습니다!<br></p>
          <a href="<%=root%>/nonuser/room/list.do" class="da-link button">더보기</a>
          <div class="da-img">
            <img src="images/Slider02.png" width="220" alt="image02">
          </div>
        </div>
        <!-------------------------- Second Slider 부분 종료 -------------------------->
        
        <!-------------------------- Third Slider 부분 시작 -------------------------->
        <div class="da-slide">
          <h2>Schedule Management System</h2>
          <h4>체계적인 일정 관리 서비스</h4>
          <p>일정 관리를 손 쉽게 Check 해주는 Scheduler 서비스를 제공합니다. <br>
             또한, 가입한 Study의 Project에 대해 알림 서비스를 제공하여 <br>
             체계적인 일정 관리를 도와드립니다! <br>
          </p>
          <a href="<%=root%>/user/mystudy/mystudy.do" class="da-link button">더보기</a>
          <div class="da-img">
            <img src="images/Slider03.png" width="240" alt="image03">
          </div>
        </div>
        <!-------------------------- Third Slider 부분 종료 -------------------------->
        
        <!-- Start cSlide navigation arrows -->
        <div class="da-arrows">
          <span class="da-arrows-prev"></span> <span
            class="da-arrows-next"></span>
        </div>
        <!-- End cSlide navigation arrows -->
      </div>
    </div>
  </div>
  <!-------------------------- 배너(Home) Section 시작 -------------------------->
  
  <!--------------------------서비스안내(Service) Section 시작 -------------------------->
  <div class="section primary-section" id="service">
    <div class="container">

      <div class="title">
        <h1>Study Desk만의 강력한 기능 3가지</h1>
      </div>
      
      <div class="row-fluid">
        
        <!-- 서비스안내 Section 1 -->
        <div class="span4">
          <div class="centered service">
            <div class="circle-border zoom-in">
              <A href="<%=root%>/nonuser/jobinfo/list_all_jobinfo.do">
                <img class="img-circle" src="images/Service1.png" alt="service 1">
              </A>
            </div>
            <h3>채용정보 제공 서비스</h3>
            <p> Study Desk에서 추천해드리는 채용 정보를 만나보세요!</p>
          </div>
        </div>
        
        <!-- 서비스안내 Section 2 -->    
        <div class="span4">
          <div class="centered service">
            <div class="circle-border zoom-in">
              <A href="<%=root%>/nonuser/contest/list_all_contest.do">
                <img class="img-circle" src="images/Service2.png" alt="service 2" />
              </A>
            </div>
            <h3> 공모전 정보 시스템 제공 </h3>
            <p>공모전에 대하여 인기 및 추천 목록까지 만날 수 있습니다!</p>
          </div>
        </div>
        
        <!-- 서비스안내 Section 3-->
        <div class="span4">
          <div class="centered service">
            <div class="circle-border zoom-in">
              <A href="<%=root%>/user/shared/list.do">
                <img class="img-circle" src="images/Service3.png" alt="service 3">
              </A>
            </div>
            <h3>스터디 자료 게시판</h3>
            <p>스터디 자료를 손 쉽게 찾아보세요!</p>
          </div>
        </div>
        
      </div>
    </div>
  </div>
 <!--------------------------서비스안내(Service) Section 종료 -------------------------->
  
  <!--------------------------Study Room(Portfolio) Section 시작-------------------------->
  <div class="section secondary-section " id="portfolio">
    <div class="triangle"></div>
    <div class="container">
    
      <div class=" title">
        <h1>Study Room </h1>
        <p>Study Desk에서 제공 중인 Study Room을 만나보세요!</p>
      </div>
      
<!------------------------- Study Room project 1 상세보기 시작------------------------->
      <div id="single-project">
        <c:forEach var="roomVO" items="${list_rorvcnt1 }">
        <div id="slidingDiv" class="toggleDiv row-fluid single-project">
          <div class="span6">
            <c:choose>
              <c:when test="${roomVO.rothumb != ''}">
                <a href="${pageContext.request.contextPath }/nonuser/room/read.do?rono=${roomVO.rono}">
                  <IMG id='rofile1' src='${pageContext.request.contextPath}/admin/room/storage/${roomVO.rofile1}' style='width: 670px; height: 356px;'> <!-- 이미지 파일명 출력 -->
                </a>
              </c:when>
              <c:otherwise> <!-- 파일이 존재하지 않는 경우 -->  
                <a href="${pageContext.request.contextPath }/nonuser/room/read.do?rono=${roomVO.rono}">
                  <img src="images/Portfolio01.png" alt="project 1" />      
                </a>
              </c:otherwise>      
            </c:choose>
          </div>
          <div class="span6">
            <div class="project-description">
              <div class="project-title clearfix">
                <h3>
                  <a class="aTag" href="${pageContext.request.contextPath }/nonuser/room/read.do?rono=${roomVO.rono}">
                  ${roomVO.roname}
                  </a>
                </h3>
                <span class="show_hide close"> <i
                  class="icon-cancel"></i>
                </span>
              </div>
              <div class="project-info">
                <div>
                  <span>카페명</span>${roomVO.roname }
                </div>
                <div>
                  <span>지 역</span>${roomVO.rolocation}
                </div>
                <div>
                  <span>운영시간</span>
                  <c:choose>
                    <c:when test="${roomVO.rorunday == null}">
                      -
                    </c:when>
                    <c:otherwise>
                    ${roomVO.rorunday}
                    </c:otherwise>
                  </c:choose>
                </div>
                <div>
                  <span>사이트</span>
                  <c:choose>
                    <c:when test="${roomVO.rosite == null}">  
                      -
                    </c:when>
                    <c:otherwise>
                    ${roomVO.rosite}
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
             <%--  <p>${roomVO.rocontent}</p> --%>
            </div>
          </div>
        </div>
        </c:forEach>
        <!------------------------- Study Room project 1 상세보기 종료------------------------->
        
         <!------------------------- Study Room project 2 상세보기 시작------------------------->
        <c:forEach var="roomVO" items="${list_rorvcnt2 }">
        <div id="slidingDiv1" class="toggleDiv row-fluid single-project">
          <div class="span6">
            <c:choose>
              <c:when test="${roomVO.rothumb != ''}">
                <a href="${pageContext.request.contextPath }/nonuser/room/read.do?rono=${roomVO.rono}">
                  <IMG id='rofile1' src='${pageContext.request.contextPath}/admin/room/storage/${roomVO.rofile1}' style='width: 670px; height: 356px;'> <!-- 이미지 파일명 출력 -->
                </a>
              </c:when>
              <c:otherwise> <!-- 파일이 존재하지 않는 경우 --> 
                <a href="${pageContext.request.contextPath }/nonuser/room/read.do?rono=${roomVO.rono}"> 
                  <img src="images/Portfolio02.png" alt="project 2" />      
                </a>
              </c:otherwise>      
            </c:choose>
          </div>
          <div class="span6">
            <div class="project-description">
              <div class="project-title clearfix">
                <h3>
                  <a class="aTag" href="${pageContext.request.contextPath }/nonuser/room/read.do?rono=${roomVO.rono}">
                  ${roomVO.roname}
                  </a>
                </h3>
                <span class="show_hide close"> <i
                  class="icon-cancel"></i>
                </span>
              </div>
              <div class="project-info">
                <div>
                  <span>카페명</span>${roomVO.roname }
                </div>
                <div>
                  <span>지 역</span>${roomVO.rolocation}
                </div>
                <div>
                  <span>운영시간</span>
                  <c:choose>
                    <c:when test="${roomVO.rorunday == null}">
                      -
                    </c:when>
                    <c:otherwise>
                    ${roomVO.rorunday}
                    </c:otherwise>
                  </c:choose>
                </div>
                <div>
                  <span>사이트</span>
                  <c:choose>
                    <c:when test="${roomVO.rosite == null}">  
                      -
                    </c:when>
                    <c:otherwise>
                    ${roomVO.rosite}
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
              <%-- <p>${roomVO.rocontent}</p> --%>
            </div>
          </div>
        </div>
        </c:forEach>
        <!------------------------- Study Room project 2 상세보기 종료------------------------->
        
        <!------------------------- Study Room project 3 상세보기 시작------------------------->
        <c:forEach var="roomVO" items="${list_rorvcnt3 }">
        <div id="slidingDiv2" class="toggleDiv row-fluid single-project">
          <div class="span6">
            <c:choose>
              <c:when test="${roomVO.rothumb != ''}">
                <a href="${pageContext.request.contextPath }/nonuser/room/read.do?rono=${roomVO.rono}">
                  <IMG id='rofile1' src='${pageContext.request.contextPath}/admin/room/storage/${roomVO.rofile1}' style='width: 670px; height: 356px;'> <!-- 이미지 파일명 출력 -->
                </a>
              </c:when>
              <c:otherwise> <!-- 파일이 존재하지 않는 경우 -->  
                <a href="${pageContext.request.contextPath }/nonuser/room/read.do?rono=${roomVO.rono}">
                  <img src="images/Portfolio03.png" alt="project 3" />
                </a>      
              </c:otherwise>      
            </c:choose>
          </div>
          <div class="span6">
            <div class="project-description">
              <div class="project-title clearfix">
                <h3>
                  <a class="aTag" href="${pageContext.request.contextPath }/nonuser/room/read.do?rono=${roomVO.rono}">
                  ${roomVO.roname}
                  </a>
                </h3>
                <span class="show_hide close"> <i
                  class="icon-cancel"></i>
                </span>
              </div>
              <div class="project-info">
                <div>
                  <span>카페명</span>${roomVO.roname }
                </div>
                <div>
                  <span>지 역</span>${roomVO.rolocation}
                </div>
                <div>
                  <span>운영시간</span>
                  <c:choose>
                    <c:when test="${roomVO.rorunday == null}">
                      -
                    </c:when>
                    <c:otherwise>
                    ${roomVO.rorunday}
                    </c:otherwise>
                  </c:choose>
                </div>
                <div>
                  <span>사이트</span>
                  <c:choose>
                    <c:when test="${roomVO.rosite == null}">  
                      -
                    </c:when>
                    <c:otherwise>
                    ${roomVO.rosite}
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
              <%-- <p>${roomVO.rocontent}</p> --%>
            </div>
          </div>
        </div>
        </c:forEach>
        <!------------------------- Study Room project 3 상세보기 종료------------------------->

        <!------------------------- Study Room project Grid 형식 시작------------------------->
        <ul id="portfolio-grid" class="thumbnails row">
          <c:forEach var="roomVO"  items="${list_rorvcnt1 }">
            <li class="span4 mix web">          
              <div class="thumbnail">
                <c:choose>
                  <c:when test="${roomVO.rothumb != ''}">
                    <IMG id='rofile1' src='${pageContext.request.contextPath}/admin/room/storage/${roomVO.rofile1}' style='width: 370px; height: 231.25px;'> <!-- 이미지 파일명 출력 -->
                    <a href="#single-project" class="more show_hide" rel="#slidingDiv"> 
                      <i class="icon-plus"></i>
                    </a>
                  </c:when>
                  <c:otherwise> <!-- 파일이 존재하지 않는 경우 -->  
                    <img src="images/Portfolio01.png" alt="project 1"> 
                    <a href="#single-project" class="more show_hide" rel="#slidingDiv"> 
                      <i class="icon-plus"></i>
                    </a>      
                  </c:otherwise>      
                </c:choose> 
                <h3>${roomVO.roname}</h3>
               <%--  <p>${roomVO.rocontent }</p> --%>
               <!--  <div class="mask"></div> -->
              </div>
            </li>
          </c:forEach>
          
          <c:forEach var="roomVO" items="${list_rorvcnt2 }">
            <li class="span4 mix photo">
              <div class="thumbnail">
                <c:choose>
                  <c:when test="${roomVO.rothumb != ''}">
                    <IMG id='rofile1' src='${pageContext.request.contextPath}/admin/room/storage/${roomVO.rofile1}'  style='width: 370px; height: 231.25px;'> <!-- 이미지 파일명 출력 -->
                    <a href="#single-project" class="more show_hide" rel="#slidingDiv1"> 
                      <i class="icon-plus"></i>
                    </a>
                  </c:when>
                  <c:otherwise> <!-- 파일이 존재하지 않는 경우 -->  
                    <img src="images/Portfolio01.png" alt="project 1"> 
                    <a href="#single-project" class="more show_hide" rel="#slidingDiv1"> 
                      <i class="icon-plus"></i>
                    </a>      
                  </c:otherwise>      
                </c:choose> 
                <h3>${roomVO.roname}</h3>
                <%-- <p>${roomVO.rocontent }</p> --%>
               <!--  <div class="mask"></div> -->
              </div>
            </li>
          </c:forEach>
          
          <c:forEach var="roomVO" items="${list_rorvcnt3 }">
            <li class="span4 mix identity">
              <div class="thumbnail">
                <c:choose>
                  <c:when test="${roomVO.rothumb != ''}">
                    <IMG id='rofile1' src='${pageContext.request.contextPath}/admin/room/storage/${roomVO.rofile1}' style='width: 370px; height: 231.25px;'> <!-- 이미지 파일명 출력 -->
                    <a href="#single-project" class="more show_hide" rel="#slidingDiv2"> 
                      <i class="icon-plus"></i>
                    </a>
                  </c:when>
                  <c:otherwise> <!-- 파일이 존재하지 않는 경우 -->  
                    <img src="images/Portfolio01.png" alt="project 1"> 
                    <a href="#single-project" class="more show_hide" rel="#slidingDiv2"> 
                      <i class="icon-plus"></i>
                    </a>      
                  </c:otherwise>      
                </c:choose> 
                <h3>${roomVO.roname}</h3>
                <%-- <p>${roomVO.rocontent }</p> --%>
                <!-- <div class="mask"></div> -->
              </div>
            </li>
          </c:forEach>
        </ul>
        </div>
      </div>
   </div>
   <!------------------------- Study Room project Grid 형식 종료------------------------->

   <!-------------------------- Footer Section 시작 -------------------------->
   <div class="footer">
     <p>Copyright ⓒ 2017 Soldesk Bigdata Machine Running 7 - 1 all rights reserved.</p>
   </div>
   <!-------------------------- Footer Section 종료 -------------------------->
        
   <!--------------------------  ScrollUp button 시작 -------------------------->
   <div class="scrollup">
     <a href="#"><i class="icon-up-open"></i></a>
   </div>
   <!--------------------------  ScrollUp button 종료 -------------------------->
        
   <!-------------------------- Javascript 관련 Include -------------------------->
  <script src="js/jquery.js"></script>
  <script type="text/javascript" src="js/jquery.mixitup.js"></script>
  <script type="text/javascript" src="js/bootstrap.js"></script>
  <script type="text/javascript" src="js/modernizr.custom.js"></script>
  <script type="text/javascript" src="js/jquery.bxslider.js"></script>
  <script type="text/javascript" src="js/jquery.cslider.js"></script>
  <script type="text/javascript" src="js/jquery.placeholder.js"></script>
  <script type="text/javascript" src="js/jquery.inview.js"></script>
  <!-- <script type="text/javascript" src="js/bootstrap-hover-dropdown.js"></script>
  <script type="text/javascript" src="bootstrap-hover-dropdown.min.js"></script> -->
  <!-- Load google maps api and call initializeMap function defined in app.js -->
<!--   <script async="" defer="" type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&callback=initializeMap"></script> -->
  <!-- css3-mediaqueries.js for IE8 or older -->
  <script type="text/javascript" src="js/app.js"></script>
</body>
</html>
                