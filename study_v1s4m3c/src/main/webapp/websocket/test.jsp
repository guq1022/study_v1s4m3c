<%@ page contentType="text/html; charset=UTF-8" %>
 
 <% 
String root = request.getContextPath(); 
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
<script type="text/javascript">
    
    var wsUri = "ws://localhost:9090/study/websocket/response.do";
    websocket = new WebSocket(wsUri);
    
    function init() {
        output = document.getElementById("output");
        websocket.onopen = function(evt) {
          onOpen(evt)
      };
    }
    
    function send_message() { 
        console.log(websocket);

        websocket.onmessage = function(evt) {
            onMessage(evt)
        };
        
        websocket.onerror = function(evt) {
            onError(evt)
        };
    }
    
    function stop(){
      websocket.onclose = function(evt){
        onStop(evt);
      }
    }
   
    function onStop(evt){
      writeToScreen("Connected to closed!");
      websocket.close(websocket);
    }
    
    function onOpen(evt) {
        writeToScreen("Connected to Endpoint!");
        doSend(textID.value);
    }
    
    function onMessage(evt) {
        writeToScreen("Message Received: " + evt.data);
    }
    
    function onError(evt) {
        writeToScreen('ERROR: ' + evt.data);
    }
    
    function doSend(message) {
        writeToScreen("Message Sent: " + message);
        websocket.send(message);
        //websocket.close();
    }
    
    function writeToScreen(message) {
        var pre = document.createElement("p");
        pre.style.wordWrap = "break-word";
        pre.innerHTML = message;
        
        output.appendChild(pre);
    }
    /* window.addEventListener("load", init, false); */
</script>

<body>
<DIV class='container'>
<DIV class='content'>

<h1 style="text-align: center;">Hello World WebSocket Client(TEST.jsp)</h1>
<br>
  <div style="text-align: center;"> 
    <form action="">
      <button onclick="init()" type="button">연결</button>
      <input onclick="send_message()" value="Send" type="button">
      <input id="textID" name="message" value="Hello WebSocket!" type="text">
      <button type="button" id="stop_btn" name="stop_btn" onclick="stop();">stop</button><br>
    </form>
  </div>
<div id="output"></div>
    
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html>