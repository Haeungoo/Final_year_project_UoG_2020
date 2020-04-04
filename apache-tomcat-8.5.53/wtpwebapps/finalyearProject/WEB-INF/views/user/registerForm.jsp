<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TutorialForOlderPeople
</title>
</head>
<body>
<form method="POST">
			<!-- userId -->
			<div>
				<label>ID</label>
					<input type="text" id="user_id" name="user_id" placeholder="ID" required>
				<div class="check_font" id="id_check"></div>
			</div>
			<!-- userPassword -->
			<div>
				<label>Password</label>
					<input type="password" id="user_pw" name="user_pw" placeholder="PASSWORD" required>
				<div class="check_font" id="pw_check"></div>
			</div>
			<!-- userPassword Confirmation -->
			<div>
				<label>Password Confirmation</label>
					<input type="password" id="user_pw2" name="user_pw2" placeholder="Confirm Password" required>
				<div class="check_font" id="pw2_check"></div>
			</div>
			<!-- userLastName-->
			<div>
				<label>LastName</label>
					<input type="text" id="user_LastName" name="user_LastName" placeholder="LastName" required>
				<div class="check_font" id="LastName_check"></div>
			</div>
			<!-- userFirstName-->
			<div>
				<label>FirstName</label>
					<input type="text" id="user_FirstName" name="user_FirstName" placeholder="FirstName" required>
				<div class="check_font" id="FirstName_check"></div>
			</div>
			<!-- Age -->
			<div>
				<label>Age</label>
					<input type="text" id="user_birth" name="user_birth" placeholder="ex)23" required>
				<div class="check_font" id="age_check"></div>
			</div>
			<!-- Confirmation Email -->
			<div>
				<label for="user_email">Email</label>
					<input type="text" id="user_email" name="user_email" placeholder="E-mail" required>
					<div class="check_font" id="email_check"></div>
			</div>
			<div>
				<a href="home"> Cancel
				</a>&emsp;&emsp;
				<button id="reg_submit"> Submit
				</button>
			</div>
		</form>
<!--[출처] 스프링(Spring) MVC 패턴을 이용한 회원가입 (mybatis 연동)|작성자 순남2  -->
<label><a href="/member/registerForm.jsp">Are you a new comer? Click here to register.</a></label>
</body>
</html>





