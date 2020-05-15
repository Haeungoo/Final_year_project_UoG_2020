<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Reference >> https://www.youtube.com/watch?v=ABoCeLjY0Xo -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chat View</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="shortcut icon" type="image/png" href="../resources/images/pengsu.PNG"/>
<link href="../resources/css/board/list.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="<c:url value="../resources/js/sockjs-0.3.4.js"/>"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.1/css/font-awesome.min.css"/>
<style type="text/css">
body{
	font-family: verdana;
}
#content, #result{
	height: 200px;
	width: 800px;
	border: 1px solid #ccc;
	padding: 10px;
	box-shadow: 0 0 10px 0 #bbb;
	margin-botton: 30px;
	font-size: 14px;
	line-height: 25px;
}
button{
	font-size: 20px;
	position: absolute;
	top: 240px;
	left: 50%;
}
</style>
<script type="text/javascript">

    $(document).ready(function() {
   
        $("#cancelBtn").on("click",function(){
			location.href = "../board/list";	
		});  
        
        $("#voiceBtn").on("click", function(){
        	startConverting();
        });
        
        $("#copyBtn").on("click", function(){
        	copyBtn();
        });
    });
    
    
    
</script>
</head>

<body>
<div class="container">
	<form name="chatForm" method="post" action="/chat/Chat">
	
	<div class="form-group">
		<label class="col-sm-2 control-label">From</label>
		<input class="form-control" type="text" name="user1" id="user1" value="${member.userId}" readonly="readonly"/><br/>
		<label class="col-sm-2 control-label">To</label>
		<input class="form-control" type="text" name="user2" id="user2" value="<%=request.getParameter("writer") %>" readonly="readonly"/><br/>
	    <label class="col-sm-2 control-label">Content</label>
	    <input class="form-control" type="text" name="content" id="content" placeholder="You can type or paste the voice content via Ctrl+V"/>
	</div>
		<input class="btn btn-primary" type="button" id="voiceBtn" value="Voice" />
		<input class="btn btn-secondary" type="button" id="copyBtn" value="Stop and Copy" />	    
		
	<div id="result" class="form-group"> 
	</div>	  
	    <input class="btn btn-success" type="submit" id="sendBtn" value="Send" />
	    <input class="btn btn-danger" type="button" id="cancelBtn" value="Exit" />
	</form>
	
	<script type="text/javascript">
		var r = document.getElementById('result');
		var speechRecognizer = new webkitSpeechRecognition();
		var recognizing = false;
		
		function startConverting(){
			if('webkitSpeechRecognition' in window){
				var speechRecognizer = new webkitSpeechRecognition();
				recognizing = true;
				speechRecognizer.continuous = true;
				speechRecognizer.interimResults = true;
				speechRecognizer.lang = 'en-UK';
				//speechRecognizer.lang = 'ko-KR';
				speechRecognizer.start();

				
				var finalTranscripts = '';
				
				speechRecognizer.onresult = function(event){
					var interimTranscripts = '';
					for(var i=0; i < event.results.length; i++){
						var transcript = event.results[i][0].transcript;
						transcript.replace("\n","<br>");
						if(event.results[i].isFinal){
							finalTranscripts += transcript;
						}else{
							interimTranscripts += transcript;
						}
					}
					r.innerHTML = finalTranscripts + '<span style="color:#999">' + interimTranscripts + '</span>';
				};
				speechRecognizer.onerror = function(event){
					
				};
			}else {
				r.innerHTML = 'Error';
			}
			
		};
	
		//https://www.google.com/intl/en/chrome/demos/speech.html
		
		function copyBtn(){
			if(recognizing){
				recognizing = false;
				speechRecognizer.stop();
			}
			alert("Scroll the text. Press Control-C to copy text.");
			
		};
		
</script>
</div>
</body>
</html>
