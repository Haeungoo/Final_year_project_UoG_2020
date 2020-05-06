<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<title>Register</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			//cancel
			$(".cancel").on("click", function(){
				location.href = "/";
			});
			
			
			$("#submit").on("click", function(){
				if($("#userPw").val()==""){
					alert("Please enter your password");
					$("#userPw").focus();
					return false;
				}
				$.ajax({ // https://melonpeach.tistory.com/49?category=806570
					url : "/member/passChk",
					type : "POST",
					dateType : "json",
					data : $("#updateForm").serializeArray(),
					success: function(data){
						
						if(data==true){
							if(confirm("Would you want to update your account?")){
								$("#updateForm").submit();
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
			<form id="updateForm" action="/member/memberUpdate" method="post">
				<div class="form-group">
					<label for="userId">ID</label>
					<input class="form-control" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="userPw">Password</label>
					<input class="form-control" type="password" id="userPw" name="userPw"/>
				</div>
				
				<label for="userRole">Role</label><br/>
				<div class="form-check">
					<label>
 						<input type="radio" class="form-check-input" name="userRole" id="Starter" value="starter" checked="checked"/>Silver Starter	
 						<img src="../resources/images/starter.jpg" alt="starter" height="200px" width="200px" />
 					</label>
 				</div>	
 				<div class="form-check">
 					<label>
 						<input type="radio" class="form-check-input" name="userRole" id="Adopter" value="adopter"/>Early Adopter
 						<img src="../resources/images/adopter.jpg" alt="adopter" height="200px" width="200px" />
 					</label>
 				</div>
			</form>
				<div class="form-check">
					<button class="btn btn-success" type="submit" id="submit">Modify member information</button>
					<button class="cancel btn btn-danger" type="button">Cancel</button>
				</div>
		</div>
	</body>
</html>