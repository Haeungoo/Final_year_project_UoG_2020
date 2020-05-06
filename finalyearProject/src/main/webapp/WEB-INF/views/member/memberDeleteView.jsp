<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>Delete Member</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			//Cancel
			$(".cancel").on("click", function(){
				location.href="/";
			})
			
			$("#submit").on("click", function(){
				if($("#userPw").val()==""){
					alert("Please enter the password");
					$("#userPw").focus();
					return false;
				}
				$.ajax({ //https://melonpeach.tistory.com/44?category=806570
					url : "/member/passChk",
					type : "POST",
					dataType : "json",
					data : $("#delForm").serializeArray(),
					success: function(data){
						if(data==true){
							if(confirm("Would you want to delete the account?")){
								$("#delForm").submit();
							}
						}else{
							alert("Wrong Password");
							return;
						}	
					}				
				})
			});
		})
		
	</script>
	<body>
		<div class="container">
			<form action="/member/memberDelete" method="post" id="delForm">
				<div class="form-group has-feedback">
					<label for="userId">ID</label>
					<input class="form-control" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly" />
				</div>
				<div class="form-group has-feedback">
					<label for="userPw">Password</label>
					<input class="form-control" type="password" id="userPw" name="userPw"/>
				</div>
				</form>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">Delete the account</button>
					<button class="cancel btn btn-danger" type="button">Cancel</button>
				</div>
				<div>
					<c:if test="${msg == false}">
						Wrong Password. Please try again :)
					</c:if>			
				</div>
		</div>
	</body>
</html>