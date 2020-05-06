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
        log.innerHTML += message.from.substring(9) + " : " + message.content + "\n";
    };
}

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
	
	
	
	$.ajax({ 
		url : "/chat/chatMessageWrite",
		type : "POST",
		data: data,
		dataType : "json",
		success: function(data){
			if(data){
				alert("Success");
			}
			else{
				alert("Fail");
			}
		}
	})
	
    ws.send(json);
}

$(document).ready(function(){
   $("#cancelBtn").on("click", function(){
      	
		location.href = "../board/list/";
		
	});    
})
</script>

<style>
body {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 80%;
    background-color: #1f1f1f;
}

#wrapper {
    width: 960px;
    margin: auto;
    text-align: left;
    color: #d9d9d9;
}

p {
    text-align: left;
}

.button {
    display: inline;
    color: #fff;
    background-color: #f2791d;
    padding: 8px;
    margin: auto;
    border-radius: 8px;
    -moz-border-radius: 8px;
    -webkit-border-radius: 8px;
    box-shadow: none;
    border: none;
}

.button:hover {
    background-color: #ffb15e;
}
.button a, a:visited, a:hover, a:active {
    color: #fff;
    text-decoration: none;
}

#addDevice {
    text-align: center;
    width: 960px;
    margin: auto;
    margin-bottom: 10px;
}

#addDeviceForm {
    text-align: left;
    width: 400px;
    margin: auto;
    padding: 10px;
}

#addDeviceForm span {
    display: block;
}

#content {
    margin: auto;
    width: 960px;
}

.device {
    width: 180px;
    height: 110px;
    margin: 10px;
    padding: 16px;
    color: #fff;
    vertical-align: top;
    border-radius: 8px;
    -moz-border-radius: 8px;
    -webkit-border-radius: 8px;
    display: inline-block;
}

.device.off {
    background-color: #c8cccf;
}

.device span {
    display: block;
}

.deviceName {
    text-align: center;
    font-weight: bold;
    margin-bottom: 12px;
}

.removeDevice {
    margin-top: 12px;
    text-align: center;
}

.device.Appliance {
    background-color: #5eb85e;
}

.device.Appliance a:hover {
    color: #a1ed82;
}

.device.Electronics {   
    background-color: #0f90d1;
}

.device.Electronics a:hover {
    color: #4badd1;
}

.device.Lights {
    background-color: #c2a00c;
}

.device.Lights a:hover {
    color: #fad232;
}

.device.Other {
    background-color: #db524d;
}

.device.Other a:hover {
    color: #ff907d;
}

.device a {
    text-decoration: none;
}

.device a:visited, a:active, a:hover {
    color: #fff;
}

.device a:hover {
    text-decoration: underline;
}


</style>

</head>

<body class="container">
	<table>
            <tr>
                <td colspan="2">
                    <button type="button" onclick="connect();" >Connect</button>
                </td>
            </tr>
            <tr>
                <td>
                    <textarea readonly="readonly" rows="10" cols="80" id="log"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" size="51" id="msg" placeholder="Message"/>
                    <button type="button" id="sendBtn" onclick="send();" >Send</button>
                    <input type="button" id="cancelBtn" value="Exit" />
                </td>
            </tr>
        </table>
</body>

</html>