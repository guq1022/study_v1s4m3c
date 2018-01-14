<%@ page contentType="text/html; charset=UTF-8" %>
 
 <% 
String root = request.getContextPath(); 
%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Study Matching Web Site</title>
</head>

<script type="text/javascript">
  /*
  [호이스팅]
  변수의 선언과 할당을 구분하는 개념.
  즉, 함수내의 선언된 어떤 위치의 변수든 함수의 최상단으로 끌어올려진다.
  그리고는 undefined로 임의의 값을 할당한다.
  */
  function hoistingTest(){
    console.log("greeting:"+hi);  // 에러가 아닌 undefined가 출력.
    var hi="hello";
    console.log("greeting2:"+hi);
  }
  
  hoistingTest();
  
  /*
  [실행 컨텍스트]
   자바 스트립트의 코드는 크게 3가지로 분류된다. global코드, function 코드, eval코드 그리고 모든 코드는 실행 컨텍스트에 들어와 실행된다.
   즉, 자바스크립트의 모든 것들을 관리하는 부분이 [실행 컨텍스트]이다.
  */
  
  console.log("A:"+A);
  B="not defined";
  console.log("B:"+B);
  
  var A="undefined"; 
  
</script>

<body>
<DIV class='container'>
<DIV class='content'>

  
    
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html>