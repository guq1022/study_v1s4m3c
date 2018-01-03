<%@ page contentType="text/html; charset=UTF-8" %>
 
 <% 
String root = request.getContextPath(); 
%>
 
<!DOCTYPE html>
<html>
<head>
 
  <title>Insert title here</title>
 
  <style>
  #div1 {
      width: 250px;
      height: 250px;
      padding: 10px; 
      margin: 0px 10px 0px 0px;
      border: 1px solid #aaaaaa; 
      float: left;
  }
  #div2 {
      width: 250px;
      height: 250px;
      padding: 10px;
      border: 1px solid #aaaaaa;
      float: left;
  }
  </style>
  
  <script>
  function allowDrop(ev) {
      ev.preventDefault();
  }
 
  function drag(ev) {
      ev.dataTransfer.setData("text", ev.target.id);
  }
 
  function drop(ev) {
      ev.preventDefault();
      var data = ev.dataTransfer.getData("text");
      ev.target.appendChild(document.getElementById(data));
  }
  </script>
 
</head>
<body>
 
<div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)">
  <img id="drag1" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/512px-Unofficial_JavaScript_logo_2.svg.png" draggable="true" ondragstart="drag(event)" width="250px" height="250px">
</div> 
 
<div id="div2" ondrop="drop(event)" ondragover="allowDrop(event)">
   
</div>
 
</body>
</html>