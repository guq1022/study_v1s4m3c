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

.li_none{
    list-style: none; /* 블렛 기호 생략 */
    margin: 10px 10px; /* 위아래 좌우 */
}
</style>

</head>
<script type="text/javascript">
$(function(){
  
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
  

    
    var li="";
    
    for(var i=0; i<seoul.length; i++){
      li+="<input type = 'checkbox' name="+i +" id="+i+ " value="+"서울"+seoul[i]+" >"+seoul[i]
    }
    $("#selected_area").append(li); 
    

    
    $("#seoul").click(function(){
      $("#selected_area").empty(); /* 태크안의 내용을 삭제. */  
    for(var i=0; i<seoul.length; i++){
      li+="<input type = 'checkbox' name="+i +" id="+i+ " value="+"서울"+seoul[i]+" >"+seoul[i]
    }
    $("#selected_area").append(li); 
    });
    
    $("#gyeonggi").click(function(){
      $("#selected_area").empty(); /* 태크안의 내용을 삭제. */  
    for(var i=0; i<gyeonggi.length; i++){
      li+="<input type = 'checkbox' name="+i +" id="+i+ " value="+"경기"+gyeonggi[i]+" >"+gyeonggi[i]
    }
    $("#selected_area").append(li); 
    });
    
    $("#incheon").click(function(){
      $("#selected_area").empty(); /* 태크안의 내용을 삭제. */  
    for(var i=0; i<incheon.length; i++){
      li+="<input type = 'checkbox' name="+i +" id="+i+ " value="+"인천"+incheon[i]+" >"+incheon[i]
    }
    $("#selected_area").append(li); 
    });
    
    $("#kangwon").click(function(){
      $("#selected_area").empty(); /* 태크안의 내용을 삭제. */  
    for(var i=0; i<kangwon.length; i++){
      li+="<input type = 'checkbox' name="+i +" id="+i+ " value="+"강원"+kangwon[i]+" >"+kangwon[i]
    }
    $("#selected_area").append(li); 
    })
    
    $("#gyeongnam").click(function(){
      $("#selected_area").empty(); /* 태크안의 내용을 삭제. */  
    for(var i=0; i<gyeongnam.length; i++){
      li+="<input type = 'checkbox' name="+i +" id="+i+ " value="+"경남"+gyeongnam[i]+" >"+gyeongnam[i]
    }
    $("#selected_area").append(li); 
    })
    
    $("#gyeongbuk").click(function(){
      $("#selected_area").empty(); /* 태크안의 내용을 삭제. */  
    for(var i=0; i<gyeongbuk.length; i++){
      li+="<input type = 'checkbox' name="+i +" id="+i+ " value="+"경북"+gyeongbuk[i]+" >"+gyeongbuk[i]
    }
    $("#selected_area").append(li); 
    })
    
    $("#gwangju").click(function(){
      $("#selected_area").empty(); /* 태크안의 내용을 삭제. */  
    for(var i=0; i<gwangju.length; i++){
      li+="<input type = 'checkbox' name="+i +" id="+i+ " value="+"광주"+gwangju[i]+" >"+gwangju[i]
    }
    $("#selected_area").append(li); 
    })
    
    $("#daegu").click(function(){
      $("#selected_area").empty(); /* 태크안의 내용을 삭제. */  
    for(var i=0; i<daegu.length; i++){
      li+="<input type = 'checkbox' name="+i +" id="+i+ " value="+"대구"+daegu[i]+" >"+daegu[i]
    }
    $("#selected_area").append(li); 
    })
    
    $("#daejeon").click(function(){
      $("#selected_area").empty(); /* 태크안의 내용을 삭제. */  
    for(var i=0; i<daejeon.length; i++){
      li+="<input type = 'checkbox' name="+i +" id="+i+ " value="+"대전"+daejeon[i]+" >"+daejeon[i]
    }
    $("#selected_area").append(li); 
    })
    
    $("#busan").click(function(){
      $("#selected_area").empty(); /* 태크안의 내용을 삭제. */  
    for(var i=0; i<busan.length; i++){
      li+="<input type = 'checkbox' name="+i +" id="+i+ " value="+"부산"+busan[i]+" >"+busan[i]
    }
    $("#selected_area").append(li); 
    })
    
    $("#sejong").click(function(){
      $("#selected_area").empty(); /* 태크안의 내용을 삭제. */  
    for(var i=0; i<sejong.length; i++){
      li+="<input type = 'checkbox' name="+i +" id="+i+ " value="+"세종"+sejong[i]+" >"+sejong[i]
    }
    $("#selected_area").append(li); 
    })
    
    $("#ulsan").click(function(){
      $("#selected_area").empty(); /* 태크안의 내용을 삭제. */  
    for(var i=0; i<ulsan.length; i++){
      li+="<input type = 'checkbox' name="+i +" id="+i+ " value="+"울산"+ulsan[i]+" >"+ulsan[i]
    }
    $("#selected_area").append(li); 
    })
    
    $("#jeonnam").click(function(){
      $("#selected_area").empty(); /* 태크안의 내용을 삭제. */  
    for(var i=0; i<jeonnam.length; i++){
      li+="<input type = 'checkbox' name="+i +" id="+i+ " value="+"전남"+jeonnam[i]+" >"+jeonnam[i]
    }
    $("#selected_area").append(li); 
    })
    
    $("#jeonbuk").click(function(){
      $("#selected_area").empty(); /* 태크안의 내용을 삭제. */  
    for(var i=0; i<jeonbuk.length; i++){
      li+="<input type = 'checkbox' name="+i +" id="+i+ " value="+"전북"+jeonbuk[i]+" >"+jeonbuk[i]
    }
    $("#selected_area").append(li); 
    })
    
    $("#jeju").click(function(){
      $("#selected_area").empty(); /* 태크안의 내용을 삭제. */  
    for(var i=0; i<jeju.length; i++){
      li+="<input type = 'checkbox' name="+i +" id="+i+ " value="+"제주"+jeju[i]+" >"+jeju[i]
    }
    $("#selected_area").append(li); 
    })
    
    $("#chungnam").click(function(){
      $("#selected_area").empty(); /* 태크안의 내용을 삭제. */  
    for(var i=0; i<chungnam.length; i++){
      li+="<input type = 'checkbox' name="+i +" id="+i+ " value="+"충남"+chungnam[i]+" >"+chungnam[i]
    }
    $("#selected_area").append(li); 
    })
    
    $("#chungbuk").click(function(){
      $("#selected_area").empty(); /* 태크안의 내용을 삭제. */  
    for(var i=0; i<chungbuk.length; i++){
      li+="<input type = 'checkbox' name="+i +" id="+i+ " value="+"충북"+chungbuk[i]+" >"+chungbuk[i]
    }
    $("#selected_area").append(li); 
    })


});


</script>
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
<DIV class='container'>

<DIV class='content'>

<div>
<span>지역</span>
<button type='button' class="btn btn-default" id='seoul'>서울</button>
<button type='button' class="btn btn-default" id='gyeonggi'>경기</button>
<button type='button' class="btn btn-default" id='incheon'>인천</button>
<button type='button' class="btn btn-default" id='kangwon'>강원</button>
<button type='button' class="btn btn-default" id='gyeongnam'>경남</button>
<button type='button' class="btn btn-default" id='gyeongbuk'>경북</button>
<button type='button' class="btn btn-default" id='gwangju'>광주</button>
<button type='button' class="btn btn-default" id='daegu'>대구</button>
<button type='button' class="btn btn-default" id='daejeon'>대전</button>
<button type='button' class="btn btn-default" id='busan'>부산</button>
<button type='button' class="btn btn-default" id='sejong'>세종</button>
<button type='button' class="btn btn-default" id='ulsan'>울산</button>
<button type='button' class="btn btn-default" id='jeonnam'>전남</button>
<button type='button' class="btn btn-default" id='jeonbuk'>전북</button>
<button type='button' class="btn btn-default" id='jeju'>제주</button>
<button type='button' class="btn btn-default" id='chungnam'>충남</button>
<button type='button' class="btn btn-default" id='chungbuk'>충북</button>
</div>


  <form name='list' id='list' method='post' action=''>
      
      
      <div id='selected_area'>
      </div>
      
      <br>
      
      <span>요일</span>
      <div>
        <input type='checkbox' id='dow' value='월'>월
        <input type='checkbox' id='dow' value='화'>화
        <input type='checkbox' id='dow' value='수'>수
        <input type='checkbox' id='dow' value='목'>목
        <input type='checkbox' id='dow' value='금'>금
        <input type='checkbox' id='dow' value='토'>토
        <input type='checkbox' id='dow' value='일'>일
      </div>
      
  </form>



 <table class="table table-hover">
    <thead>
      <tr>
        <th>분야</th>
        <th>제목</th>
        <th>지역</th>
        <th>요일</th>
        <th>시간</th>
        <th>모집인원수</th>
        <th>현재인원수</th>
        <th>상태</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
 <c:forEach var="StudyListVO" items="${list}">
 
  
      <tr>
        <td>${StudyListVO.stdlist_topic} </td>
        <td><a href='/study/studylist/read.do?stdlist_no=${StudyListVO.stdlist_no}&memberno=${StudyListVO.memberno} '>${StudyListVO.stdlist_title}</a></td>
        <td>${StudyListVO.stdlist_area}</td>
        <td>${StudyListVO.stdlist_dow}</td>
        <td>${StudyListVO.stdlist_time}</td>
        <td ><span class="badge badge-info">${StudyListVO.stdlist_tot_num}</span></td>
        <td ><span class="badge badge-info">${StudyListVO.stdlist_curr_num}</span></td>
        <td>
        <c:choose>
          <c:when test="${StudyListVO.stdlist_curr_num eq StudyListVO.stdlist_tot_num}">
            <span class="label label-important">모집마감</span>
          </c:when>
          <c:otherwise>
            <span class="label label-important">모집중</span>
          </c:otherwise>

        </c:choose>          
        </td>
        <td>${StudyListVO.stdlist_cnt}</td>
      </tr>      
   

</c:forEach>
 </tbody>
 </table>
</DIV> <!-- content END -->


</DIV> <!-- container END -->
 <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>