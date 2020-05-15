<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="shortcut icon" type="image/png" href="../resources/images/pengsu.PNG"/>
<link href="../resources/css/chat/chatView2.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>Chat View</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>

<script type="text/javascript">
var ws;

function connect() {
    var username = '<%=request.getParameter("sender")%>';
    
    var host = document.location.host;
    var pathname = document.location.pathname;
    
    
    ws = new WebSocket("ws://" + host  + pathname + username);

    ws.onmessage = function(event) {
   		var log = document.getElementById("log");
        console.log(event.data);
        var message = JSON.parse(event.data);
      //  log.innerHTML += message.from.substring(9) + "<br/>" + message.content + "<br/>"  + message.senddate +"<br/>";
    };
    
}

window.setInterval(function(){
	var mno = $($(".mno").last()).val();
	var cno = '<%=request.getParameter("cno")%>';
	$.ajax({
		url: "newMessages?mno="+mno+"&cno="+cno,
		type: "GET",
		success: function(message)
		{
			$("#log").append(message);
		}
	})
}, 500);

function send() {
    var content = document.getElementById("msg").value;
    var json = JSON.stringify({
        "content":content
		
    });

    var data = {};
	var sender = '<%=request.getParameter("sender")%>';
	var cno = '<%=request.getParameter("cno")%>';
	
	data['cno'] = cno;
	data['user1'] = sender;
	data['content'] = document.getElementById("msg").value;
	
	$("#msg").val("");
	
	$.ajax({ 
		url : "/chat/chatMessageWrite",
		type : "POST",
		data: data,
		dataType : "json",
		success: function(data){
			if(data){
			}
			else{
			}
		}
	})
	
    ws.send(json);
}

function reloadPage(){
	location.reload(true);
}

$(document).ready(function(){
   $("#cancelBtn").on("click", function(){
      	
		location.href = "../board/list";
		
	});    
   $("#msg").keydown(function(key){
	  if(key.keyCode == 13){
		  send();
	  } 
   });
})
</script>

<style>

</style>

</head>

<body class="container" onload="connect();">
	<div id="chat-room">
		<div class="message-box">
				<table>
		            <tr>
		                <td>
		                    <div id="log">
		                    <c:forEach items="${messages}" var="message"><br/> 
		      
		                    <div class="message-group" data-date-str="<fmt:formatDate value="${message.senddate}" pattern="MMM dd, yyyy"/>">
							<c:set var="sender" value='<%=request.getParameter("sender")%>'/>
							<c:if test="${sender != message.user1 }">
							<div class="chat-message other">
								<section><i class="fa fa-user"></i></section>
								<input type="hidden" class="mno" value="${message.mno}"/>
								<span id="user"><c:out value="${message.user1}"/></span><br/>
								<div id="content"><c:out value="${message.content}"/></div> &nbsp; &nbsp; &nbsp; &nbsp;
								<p id='date' style='display:inline'><fmt:formatDate value="${message.senddate}" pattern="HH:mm"/></p>
							</div>
							</c:if>
							<c:if test="${sender == message.user1 }">
							<div class="chat-message mine">
								<section><i class="fa fa-user"></i></section>
								<input type="hidden" class="mno" value="${message.mno}"/>
								<span id="user"><c:out value="${message.user1}"/></span><br/>
								<div id="content"><c:out value="${message.content}"/></div>
								<p id='date' style='display:inline'><fmt:formatDate value="${message.senddate}" pattern="HH:mm"/></p>
							</div>
							</c:if>
							</div>
							</c:forEach>
							</div>
		                </td>
		            </tr>
		            <tr>
		                <td>
		                	<div class="input-box">
		                    <input type="text" size="51" id="msg" placeholder="Message"/>
		                    <button type="button" id="sendBtn" onclick="send();" >Send</button>
		                    <input type="button" id="cancelBtn" value="Exit" />
		                	</div>
		                </td>
		            </tr>
		    	</table>
    		</div>
    	</div>
</body>

</html>