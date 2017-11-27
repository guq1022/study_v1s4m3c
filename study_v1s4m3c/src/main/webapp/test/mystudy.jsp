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

<style type="text/css">
*{
  color: #000000;
}
</style>

<!-------------------------- Web Logo Part -------------------------->
<link rel="shortcut icon" href="<%=root%>/main/images/ico/Short Logo.png">
<!---------------------------------------------------------------------->

<!-- 
1. #FECE1A
2. #2d2d30 
-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  $("#meminfo_select").change(function(){
    var memberno=$("#meminfo_select").val();
    $.ajax({
      url: "./meminfo.do",
      type: "GET",
      cache: false,    // 일반적으로 false
      dataType: "json", // or json
      data: "memberno="+memberno,
      success: function(data){
        
        var f=$('#meminfo_tbody > #meminfo_tr');

        // json에서 받은 값(data 객체)을 jquery를 사용하여 대입한다.

        $('#no', f).text (data.memberno);
        $('#name', f).text(data.name);
        $('#passwd', f).text(data.passwd);
          
      },
      // 통신 에러, 요청 실패, 200 아닌 경우, dataType이 다른경우
      error: function (request, status, error){  
        var msg = "ERROR<br><br>"
        msg +="에러가 발생 했습니다."+"<br>";
        msg +="다시 시도해주세요."+"<br>";
        msg += request.status + "<br>" + request.responseText + "<br>" + error;
        
        var panel="";
        panel+="<DIV>";
        panel+=msg;
        panel+="</DIV>";
        
        $('#warn_modal').html(panel);
        $('#warn_modal').show();
      }
    });
  });
});

</script>

</head>
<body> 
<jsp:include page="/menu/top.jsp" flush="false" />
<DIV class='container'>
<DIV class='content' style="min-height: calc(100vh - 40px);">

<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

    <!--
    글쓰기, 댓글, 대댓글 작성의 공통사항 : 작성자의 memberno를 가지고 회원의 정보(이름 등)를 가져와야 한다.
    
    1. 댓글을 작성하면 자동으로 memberno가 전달.
    2. 전달되어진 memberno를 바탕으로 member테이블 조회.
    3. resultType은 MeminfoVO로 하여 번호에 해당되는 회원 정보를 반환.
    4. MeminfoVO를 mav.addObject()를 통해 jsp에 전달하고 JSTL을 통해 해당 데이터 접근.
    -->
    
    <DIV class="well well-xs" id="first_table">
      <select id="meminfo_select">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
      </select>
      
      <TABLE class='table table-striped' style="margin-top: 1%;">
        <colgroup>
          <col style='width: 33%;'/>
          <col style='width: 33%;'/>
          <col style='width: 33%;'/>
        </colgroup> 
       
        <thead>
          <TR class="label-success">
            <TH style='text-align: center ;'>회원 번호</TH>
            <TH style='text-align: center ;'>이름</TH>
            <TH style='text-align: center ;'>패스워드</TH>
          </TR>
        </thead>
        
        <!-- 컨트롤러에서 mav객체에 list를 추가하지 않아도 여기서 에러 발견 x -->
        <tbody id="meminfo_tbody">
          <tr id="meminfo_tr">
            <td id="no" style='text-align: center;'></td>
            <td id="name" style='text-align: center;'></td>
            <td id="passwd" style='text-align: center;'></td>
          </tr>
        </tbody>
  
      </TABLE>
    </DIV>
    
  <TABLE class='table table-striped' style="margin-top: 1%;">
      <colgroup>
        <col style='width: 15%;'/>
        <col style='width: 10%;'/>
        <col style='width: 20%;'/>
        <col style='width: 35%;'/>
        <col style='width: 20%;'/>
      </colgroup>
     
      <thead>
        <TR class="label-success">
          <TH style='text-align: center ;'>스터디 번호</TH>
          <TH style='text-align: center ;'>주제</TH>
          <TH style='text-align: center ;'>지역</TH>
          <TH style='text-align: center ;'>등록일</TH>
          <TH style='text-align: center ;'>등록자 번호</TH>
        </TR>
      </thead>
      
      <!-- 컨트롤러에서 mav객체에 list를 추가하지 않아도 여기서 에러 발견 x -->
      <tbody>
        <c:forEach var="studylistVO" items="${list}">
        <tr>
          <td style='text-align: center;'>${studylistVO.std_no}</td>
          <td style='text-align: center;'>${studylistVO.topic}</td>
          <td>${studylistVO.area}</td>
          <td style='text-align: center;'>${studylistVO.stratdate}</td>
          <td style='text-align: center;'>${studylistVO.memberno}</td>
        </tr>
        </c:forEach>
      </tbody>

    </TABLE>
    

    <TABLE class='table table-striped' style="margin-top: 1%;">
      <colgroup>
        <col style='width: 33%;'/>
        <col style='width: 33%;'/>
        <col style='width: 33%;'/>
      </colgroup> 
     
      <thead>
        <TR class="label-success">
          <TH style='text-align: center ;'>회원 번호</TH>
          <TH style='text-align: center ;'>이름</TH>
          <TH style='text-align: center ;'>패스워드</TH>
        </TR>
      </thead>
      
      <!-- 컨트롤러에서 mav객체에 list를 추가하지 않아도 여기서 에러 발견 x -->
      <tbody>
        <c:forEach var="memberlistVO" items="${mem_list}">
        <tr>
          <td style='text-align: center;'>${memberlistVO.memberno}</td>
          <td style='text-align: center;'>${memberlistVO.membername}</td>
          <td style='text-align: center;'>${memberlistVO.passwd}</td>
        </tr>
        </c:forEach>
      </tbody>

    </TABLE>

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Modal Header</h4>
          </div>
          <div class="modal-body" id="warn_modal">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
          </div>
        </div>
        
      </div>
    </div>
    
    
</DIV> <!-- content END -->
</DIV> <!-- container END -->
<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
</html>