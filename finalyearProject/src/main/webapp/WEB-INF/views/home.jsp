<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="shortcut icon" type="image/png" href="../resources/images/pengsu.PNG"/>
<link href="../resources/css/board/list.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="member/logout";
		});
		
		$("#registerBtn").on("click",function(){
			location.href="member/register";
		});
		$("#memberUpdateBtn").on("click",function(){
			location.href="member/memberUpdateView";
		});
		
		$(".delete").on("click", function(){
			location.href = "member/memberDeleteView";
		});
		
		$("#loginBtn").keydown(function(key){
			if(key.keyCode == 13){
				submit();
			} 
		});
		
		$('[data-toggle="tooltip"]').tooltip();
	})
</script>
<body>
<div class="container">
	<header>
		<h1><a href="/board/list" data-toggle="tooltip" data-placement="right" title="Press it if you want to go to the bulletin board">Board</a></h1>
	</header>
	<hr />
	
	<form name="homeForm" method="post" action="/member/login" class="was-validated">
		<c:if test="${member == null}">
			<div class="form-group">
				<label for="userId">ID</label>
				<input type="text" class="form-control" id="userId" name="userId" placeholder="Enter userID" required/>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out ID field.</div>
			</div>
			<div class="form-group">
				<label for="userPw">Password</label>
				<input type="password" class="form-control" id="userPw" name="userPw" placeholder="Enter password" required/>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out Password field.</div>
			</div>
			<div class="form-group">
				<button class="btn btn-primary" id="loginBtn" type="submit">Login</button>
				<button class="btn btn-secondary" id="registerBtn" type="button">Register</button>
			</div>
		</c:if>
		
		<c:if test="${member != null}">	
			<div class="container">
				<p id="afterlogin">Welcome, user ${member.userId}</p>
				<button class="modify btn btn-success" id="memberUpdateBtn" type="button">Modify user information</button><br/>
				<button class="delete btn btn-warning" id="memberDeleteBtn" type="button">Withdraw from the website</button><br/>
				<button class="btn btn-danger" id="logoutBtn" type="button">Logout</button><br/>
			</div>
		</c:if>
		 
		<c:if test="${msg == false}">
			<p id="failMsg">Login failed! Please check your ID and Password</p>
		</c:if>
	</form>
</div>
</body>
</html>