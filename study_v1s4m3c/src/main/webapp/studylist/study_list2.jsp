<%@ page contentType="text/html; charset=UTF-8" %>
 
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
  
  
});


</script>
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
<DIV class='container'>

<DIV class='content'>

<button type='button' class="btn btn-default" onclick='check_seoul()'>서울</button>
<button type='button' class="btn btn-default" onclick='check_gyeonggi()'>경기</button>
<button type='button' class="btn btn-default" onclick='check_incheon()'>인천</button>
<button type='button' class="btn btn-default" onclick='check_kangwon()'>강원</button>
<button type='button' class="btn btn-default" onclick='check_gyeongnam()'>경남</button>
<button type='button' class="btn btn-default" onclick='check_gyeongbuk()'>경북</button>
<button type='button' class="btn btn-default" onclick='check_gwangju()'>광주</button>
<button type='button' class="btn btn-default" onclick='check_daegu()'>대구</button>
<button type='button' class="btn btn-default" onclick='check_daejeon()'>대전</button>
<button type='button' class="btn btn-default" onclick='check_busan()'>부산</button>
<button type='button' class="btn btn-default" onclick='check_sejong()'>세종</button>
<button type='button' class="btn btn-default" onclick='check_ulsan()'>울산</button>
<button type='button' class="btn btn-default" onclick='check_jeonnam()'>전남</button>
<button type='button' class="btn btn-default" onclick='check_jeonbuk()'>전북</button>
<button type='button' class="btn btn-default" onclick='check_jeju()'>제주</button>
<button type='button' class="btn btn-default" onclick='check_chungnam()'>충남</button>
<button type='button' class="btn btn-default" onclick='check_chungbuk()'>충북</button>

<div id="seoul" class="check_box_seoul">
  <form name='frm_seoul' id='frm_seoul' method='post' action=''>
    <input type = 'checkbox' name='' id='' value='서울전체'>전체 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울강남구'>강남구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='서울강동구'>강동구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울강북구'>강북구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울강서구'>강서구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='서울관악구'>관악구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울광진구'>광진구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울구로구'>구로구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울금천구'>금천구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울노원구'>노원구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울도봉구'>도봉구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울동대문구'>동대문구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울동작구'>동작구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울마포구'>마포구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울서대문구'>서대문구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울서초구'>서초구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울성동구'>성동구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울성북구'>성북구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울송파구'>송파구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울양천구'>양천구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울영등포구'>영등포구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울용산구'>용산구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울은평구'>은평구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울종로구'>종로구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울중구'>중구 &nbsp;
    <input type = 'checkbox' name='' id='' value='서울중랑구'>중랑구 &nbsp;
  </form>
</div>

<div id="gyeonggi" class="check_box_gyeonggi">
  <form name='frm_gyeonggi' id='frm_gyeonggi' method='post' action=''>
    <input type = 'checkbox' name='' id='' value='경기전체'>전체 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기가평군'>가평군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기고양시 덕양구'>고양시 덕양구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기고양시 일산동구'>고양시 일산동구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기고양시 일산서구'>고양시 일산서구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기과천시'>과천시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기광명시'>광명시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기광주시'>광주시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기구리시'>구리시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기군포시'>군포시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기김포시'>김포시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기남양주시'>남양주시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기동두천시'>동두천시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기부천시 소사구'>부천시 소사구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기부천시 오정구'>부천시 오정구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기부천시 원미구'>부천시 원미구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기성남시 분당구'>성남시 분당구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기성남시 수정구'>성남시 수정구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기성남시 중원구'>성남시 중원구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기수원시 권선구'>수원시 권선구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기수원시 장안구'>수원시 장안구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기수원시 팔달구'>수원시 팔달구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기시흥시'>시흥시 &nbsp;  
    <input type = 'checkbox' name='' id='' value='경기안산시 단원구'>안산시 단원구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기안산시 상록구'>안산시 상록구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기안성시'>안성시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기안양시 동안구'>안양시 동안구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기안양시 만안구'>안양시 만안구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기양주시'>양주시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기양평군'>양평군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기여주군'>여주군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기연천군'>연천군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기오산시'>오산시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기용인시 기흥구'>용인시 기흥구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기용인시 수지구'>용인시 수지구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기용인시 처인구'>용인시 처인구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기의왕시'>의왕시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기의정부시'>의정부시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기이천시'>이천시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기파주시'>파주시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기평택시'>평택시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기포천시'>포천시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기하남시'>하남시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경기화성시'>화성시 &nbsp; 

  </form>
</div>

<div id="incheon" class="check_box_incheon">
  <form name='frm_incheon' id='frm_incheon' method='post' action=''>
    <input type = 'checkbox' name='' id='' value='인천전체'>전체 &nbsp; 
    <input type = 'checkbox' name='' id='' value='인천강화군'>강화군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='인천계양구'>계양구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='인천남구'>남구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='인천남동구'>남동구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='인천동구'>동구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='인천부평구'>부평구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='인천서구'>서구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='인천연수구'>연수구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='인천옹진구'>옹진구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='인천중구'>중구 &nbsp; 
  </form>
</div>

<div id="kangwon" class="check_box_kangwon">
  <form name='frm_kangwon' id='frm_kangwon' method='post' action=''>
    <input type = 'checkbox' name='' id='' value='강원전체'>전체 &nbsp; 
    <input type = 'checkbox' name='' id='' value='강원고성군'>고성군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='강원동해시'>동해시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='강원삼척시'>삼척시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='강원속초시'>속초시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='강원양구군'>양구군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='강원양양군'>양양군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='강원영월군'>영월군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='강원원주시'>원주시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='강원인제군'>인제군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='강원정선군'>정선군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='강원철원군'>철원군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='강원춘천시'>춘천시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='강원태백시'>태백시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='강원평창군'>평창군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='강원홍천군'>홍천군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='강원화천군'>화천군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='강원횡성군'>횡성군 &nbsp; 
  </form>
</div>

<div id="gyeongnam" class="check_box_gyeongnam">
  <form name='frm_gyeongnam' id='frm_gyeongnam' method='post' action=''>
    <input type = 'checkbox' name='' id='' value='경남전체'>전체 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남거제시'>거제시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남거창군'>거창군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남고성군'>고성군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남김해시'>김해시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남남해군'>남해군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남밀양시'>밀양시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남사천시'>사천시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남산청군'>산청군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남양산시'>양산시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남의령군'>의령군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남진주시'>진주시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남창녕군'>창녕군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남창원시 마산합포구'>창원시 마산합포구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남창원시 마산회원군'>창원시 마산회원군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남창원시 성산구'>창원시 성산구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남창원시 의창구'>창원시 의창구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남창원시 진해구'>창원시 진해구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남통영시'>통영시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남하동군'>하동군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남함안군'>함안군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남함양군'>함양군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경남합천군'>합천군 &nbsp; 
  </form>
</div>

<div id="gyeongbuk" class="check_box_gyeongbuk">
  <form name='frm_gyeongbuk' id='frm_gyeongbuk' method='post' action=''>
    <input type = 'checkbox' name='' id='' value='경북전체'>전체 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북경산시'>경산시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북경주시'>경주시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북고령군'>고령군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북구미시'>구미시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북군위군'>군위군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북김천시'>김천시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북문경시'>문경시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북봉화군'>봉화군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북상주시'>상주시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북성주군'>성주군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북안동시'>안동시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북영덕군'>영덕군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북영양군'>영양군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북영주시'>영주시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북영천시'>영천시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북예천군'>예천군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북울릉군'>울릉군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북울진군'>울진군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북의성군'>의성군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북청도군'>청도군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북청송군'>청송군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북칠곡군'>칠곡군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북포항시 남구'>포항시 남구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='경북포항시 북구'>포항시 북구 &nbsp; 
   
  </form>
</div>

<div id="gwangju" class="check_box_gwangju">
  <form name='frm_gwangju' id='frm_gwangju' method='post' action=''>
    <input type = 'checkbox' name='' id='' value='광주전체'>전체 &nbsp; 
    <input type = 'checkbox' name='' id='' value='광주광산구'>광산구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='광주남구'>남구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='광주동구'>동구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='광주북구'>북구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='광주서구'>서구 &nbsp; 
  </form>
</div>

<div id="daegu" class="check_box_daegu">
  <form name='frm_daegu' id='frm_daegu' method='post' action=''>
    <input type = 'checkbox' name='' id='' value='대구전체'>전체 &nbsp; 
    <input type = 'checkbox' name='' id='' value='대구남구'>남구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='대구달서구'>달서구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='대구달성군'>달성군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='대구동구'>동구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='대구북구'>북구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='대구서구'>서구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='대구수성구'>수성구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='대구중구'>중구 &nbsp; 
  </form>
</div>

<div id="daejeon" class="check_box_daejeon">
  <form name='frm_daejeon' id='frm_daejeon' method='post' action=''>
    <input type = 'checkbox' name='' id='' value='대전전체'>전체 &nbsp; 
    <input type = 'checkbox' name='' id='' value='대전대덕구'>대덕구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='대전동구'>동구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='대전서구'>서구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='대전유성구'>유성구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='대전중구'>중구 &nbsp; 
  </form>
</div>

<div id="busan" class="check_box_busan">
  <form name='frm_busan' id='frm_busan' method='post' action=''>
    <input type = 'checkbox' name='' id='' value='부산전체'>전체 &nbsp; 
    <input type = 'checkbox' name='' id='' value='부산강서구'>강서구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='부산금정구'>금정구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='부산기장군'>기장군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='부산남구'>남구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='부산동구'>동구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='부산동래구'>동래구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='부산부산진구'>부산진구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='부산북구'>북구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='부산사상구'>사상구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='부산사하구'>사하구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='부산서구'>서구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='부산수영구'>수영구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='부산연제구'>연제구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='부산영도구'>영도구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='부산중구'>중구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='부산해운대구'>해운대구 &nbsp; 
  </form>
</div>

<div id="sejong" class="check_box_sejong">
  <form name='frm_sejong' id='frm_sejong' method='post' action=''>
    <input type = 'checkbox' name='' id='' value='세종전체'>전체 &nbsp; 
    <input type = 'checkbox' name='' id='' value='세종세종시'>세종시 &nbsp; 
  </form>
</div>

<div id="ulsan" class="check_box_ulsan">
  <form name='frm_ulsan' id='frm_ulsan' method='post' action=''>
    <input type = 'checkbox' name='' id='' value='울산전체'>전체 &nbsp; 
    <input type = 'checkbox' name='' id='' value='울산남구'>남구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='울산동구'>동구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='울산북구'>북구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='울산울주군'>울주군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='울산중구'>중구 &nbsp; 
  </form>
</div>

<div id="jeonnam" class="check_box_jeonnam">
  <form name='frm_jeonnam' id='frm_jeonnam' method='post' action=''>
    <input type = 'checkbox' name='' id='' value='전남전체'>전체 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남강진군'>강진군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남고흥군'>고흥군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남곡성군'>곡성군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남광양시'>광양시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남구례군'>구례군  &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남나주시'>나주시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남담양군'>담양군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남목포시'>목포시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남무안군'>무안군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남보성군'>보성군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남순천시'>순천시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남신안군'>신안군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남여수시'>여수시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남영광군'>영광군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남영암군'>영암군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남완도군'>완도군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남장성군'>장성군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남장흥군'>장흥군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남진도군'>진도군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남함평군'>함평군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남해남군'>해남군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전남화순군'>화순군 &nbsp; 
  </form>
</div>

<div id="jeonbuk" class="check_box_jeonbuk">
  <form name='frm_jeonbuk' id='frm_jeonbuk' method='post' action=''>
    <input type = 'checkbox' name='' id='' value='전북전체'>전체 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전북고창군'>고창군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전북군산시'>군산시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전북김제시'>김제시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전북남원시'>남원시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전북무주군'>무주군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전북부안군'>부안군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전북순창군'>순창군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전북완주군'>완주군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전북익산시'>익산시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전북임실군'>임실군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전북장수군'>장수군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전북전주시 덕진구'>전주시 덕진구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전북전주시 완산구'>전주시 완산구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전북정읍시'>정읍시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='전북진안군'>진안군 &nbsp; 
  </form>
</div>

<div id="jeju" class="check_box_jeju">
  <form name='frm_jeju' id='frm_jeju' method='post' action=''>
    <input type = 'checkbox' name='' id='' value='제주전체'>전체 &nbsp; 
    <input type = 'checkbox' name='' id='' value='제주서귀포시'>서귀포시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='제주제주시'>제주시 &nbsp; 
  </form>
</div>

<div id="chungnam" class="check_box_chungnam">
  <form name='frm_chungnam' id='frm_chungnam' method='post' action=''>
    <input type = 'checkbox' name='' id='' value='충남전체'>전체 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충남계룡시'>계룡시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충남공주시'>공주시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충남금산군'>금산군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충남논산시'>논산시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충남당진시'>당진시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충남보령시'>보령시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충남부여군'>부여군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충남서산시'>서산시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충남서천군'>서천군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충남아산시'>아산시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충남예산군'>예산군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충남천안시 동남구'>천안시 동남구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충남천안시 서북구'>천안시 서북구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충남청양군'>청양군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충남태안군'>태안군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충남홍성군'>홍성군 &nbsp; 
  </form>
</div>

<div id="chungbuk" class="check_box_chungbuk">
  <form name='frm_chungbuk' id='frm_chungbuk' method='post' action=''>
    <input type = 'checkbox' name='' id='' value='충북전체'>전체 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충북괴산군'>괴산군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충북단양군'>단양군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충북보은군'>보은군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충북영동군'>영동군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충북옥천군'>옥천군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충북음성군'>음성군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충북제천시'>제천시 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충북증평군'>증평군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충북진천군'>진천군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충북청원군'>청원군 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충북청주시 상당구'>청주시 상당구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충북청주시 흥덕구'>청주시 흥덕구 &nbsp; 
    <input type = 'checkbox' name='' id='' value='충북충주시'>충주시 &nbsp; 
  </form>
</div>

 

</DIV> <!-- content END -->


</DIV> <!-- container END -->
 <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>