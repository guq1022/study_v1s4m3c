<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<script type="text/javascript">

$(function(){
  
  var checkedArr = [];
  
  $("input[name='seoul']:checked").each(function(i){
    checkedArr.push($(this).val());
  });
           
  
  var alldata = {"checkedArr ":checkedArr};
  
      $.ajax({
        url : './checkseoul.do',
        type : 'GET',
        data : alldata,
        success : function(data) {
          console.log('return string : ' + data);
        },
        error : function() { console.log('error');
        }
      });
    
  });




</script>
</head>
<body>
<DIV class='container'>
<DIV class='content'>

<button type='button' class="btn btn-default" onclick='check_seoul()'>서울</button>


<div id="seoul" class="check_box_seoul">
  <form name='frm_seoul' id='frm_seoul' method='post' action=''>
  
    <input type = 'checkbox' name='seoul' id='seoul' value='서울전체'>전체 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울강남구'>강남구 &nbsp; 
    <input type = 'checkbox' name='seoul' id='seoul' value='서울강동구'>강동구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울강동구'>강북구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울강서구'>강서구 &nbsp; 
    <input type = 'checkbox' name='seoul' id='seoul' value='서울관악구'>관악구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울광진구'>광진구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울구로구'>구로구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울금천구'>금천구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울노원구'>노원구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울도봉구'>도봉구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울동대문구'>동대문구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울동작구'>동작구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울마포구'>마포구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울서대문구'>서대문구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울서초구'>서초구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울성동구'>성동구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울성북구'>성북구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울송파구'>송파구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울양천구'>양천구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울영등포구'>영등포구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울용산구'>용산구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울은평구'>은평구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울종로구'>종로구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울중구'>중구 &nbsp;
    <input type = 'checkbox' name='seoul' id='seoul' value='서울중랑구'>중랑구 &nbsp;
    
    <button type = 'submit'>보내기</button>
  </form>
</div>
</DIV> <!-- content END -->
</DIV> <!-- container END -->
 
</body>
</html>

