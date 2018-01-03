<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
 
<script type="text/JavaScript"
        src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        
</head>
<body>
<DIV class='container'>
<DIV class='content'>
     JS Test<br><br>
  <script type="text/javascript">
  window.onload = function(){
  var str = "봄<br>여름<br>가을<br>겨울"; 
  
  $('#panel1').html(str);
  $('#panel2').text(str); 
  str = str.replace("<br>","&lt;BR&gt;"); // 하나의 문자열만 변환
  $('#panel3').html(str);
 
  str = "봄<br>여름<br>가을<br>겨울"; 
  str = str.replace(/<br>/g, '&lt;BR&gt;'); // <br> 문자열을 모두  '<BR>'로 변경
  $('#panel4').text(str);
  $('#panel5').html(str);
  
   str = "봄\n여름\n가을\n겨울";
   str = str.replace(/\n/g, '&lt;BR&gt;'); // TextArea에서 엔터키 저장, 엔터를 \n으로 저장한다.
     $('#panel6').text(str);
     $('#panel7').html(str);
    
}
   
  function convert_str() { 
  var str = $('#content').val();
    $('#panel8').text(str);
    $('#panel9').html(str);
    str = str.replace(/\r\n/g, '<br>'); // \r\n 문자열을 모두  '<BR>'로 변경
    $('#panel10').text(str);
    $('#panel11').html(str); 
    str = str.replace(/\n/g, '<br>'); // \n 문자열을 모두  '<BR>'로 변경   .text()는 엔터를 \r\n으로 저장한다.
                                      //                                   .html()은 엔터를 \n으로 저장한다.
    $('#panel12').text(str);
    $('#panel13').html(str);
  }
  </script>
 
  <DIV id='panel1' style='border: solid 1px #00FF00; padding: 10px; margin: 10px;'>HTML</DIV>
  
  <DIV id='panel2' style='border: solid 1px #00FF00; padding: 10px; margin: 10px;'>TEXT</DIV>
  
  <DIV id='panel3' style='border: solid 1px #00FF00; padding: 10px; margin: 10px;'>HTML</DIV>
 
  <DIV id='panel4' style='border: solid 1px #00FF00; padding: 10px; margin: 10px;'>TEXT</DIV>
 
  <DIV id='panel5' style='border: solid 1px #00FF00; padding: 10px; margin: 10px;'>HTML</DIV>
  
  <DIV id='panel6' style='border: solid 1px #00FF00; padding: 10px; margin: 10px;'>TEXT</DIV>
  
  <DIV id='panel7' style='border: solid 1px #00FF00; padding: 10px; margin: 10px;'>HTML</DIV>
  <br>
   
  <TEXTAREA id='content' rows="5" cols="20"></TEXTAREA><button id='convert' onclick="convert_str()">변환</button>
  <DIV id='panel8' style='border: solid 1px #FF0000; padding: 10px; margin: 10px;'>TEXT</DIV>
  <DIV id='panel9' style='border: solid 1px #FF0000; padding: 10px; margin: 10px;'>HTML</DIV>
  <DIV id='panel10' style='border: solid 1px #0000FF; padding: 10px; margin: 10px;'>TEXT</DIV>
  <DIV id='panel11' style='border: solid 1px #0000FF; padding: 10px; margin: 10px;'>HTML</DIV>
  <DIV id='panel12' style='border: solid 1px #0000FF; padding: 10px; margin: 10px;'>TEXT</DIV>
  <DIV id='panel13' style='border: solid 1px #0000FF; padding: 10px; margin: 10px;'>HTML</DIV>
  <br><br><br><br><br>      
</DIV> <!-- content END -->
 
</DIV> <!-- container END -->
 
</body>
</html>