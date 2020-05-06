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
		$(".cancel").on("click",function(){
			location.href = "/";
		})
		
	
	})
	
	function fn_idChk(){
		$.ajax({
			url: "/member/idChk",
			type: "post",
			dataType: "json",
			data: {"userId": $("#userId").val()},
			success : function(data){
				if(data == 1){
					$("#duplicate").show();
					$("#valid").hide();
					$("#invalid").hide();
				}else if(data == 0){
					$("#duplicate").hide();
					$("#valid").show();
					$("#invalid").hide();
					
				}
			}
		
		});
	}

</script>
<body>
<div class="container">
		<form action="/member/register" method="post" id="regForm" class="was-validated">
			<div class="form-group">
				<label for="userId">ID</label>
				<input class="form-control" onchange="fn_idChk();" type="text" id="userId" name="userId" required/>
				<div id="valid" class="valid-feedback">Valid.</div>
				<div id="invalid" class="invalid-feedback">Please fill out ID field.</div>
				<div id="duplicate" style="display:none" class="invalid-feedback">The same ID exists</div>
			</div>
			
 			<div class="form-group">
				<label for="userPw">Password</label>
				<input class="form-control" type="password" id="userPw" name="userPw" required/>
 				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out Password field.</div>
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
			<div class="form-group">
				<button class="btn btn-primary" type="submit" id="submit">Register</button>
				<button class="cancel btn btn-danger" type="button">Cancel</button>
			</div>
		 </form>
</div>
</body>
</html>