<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <!-- UTF-8 for language like Korean -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TutorialForOlderPeople
</title>
</head>
<body>
<form method="POST" action="user/confirmId">
<div>
	<label>ID</label>
	<input type="text" id="user_id" name="user_id" placeholder="ID" required>
	<div class="check_font" id="id_check"></div>
</div>
<div>
	<label>Password</label>
	<input type="password" id="user_pw" name="user_pw" placeholder="PASSWORD" required>
	<div class="check_font" id="pw_check"></div>
</div>
<div>
	<button id="submit">Submit</button>
</div>
</form>
<label><a href="user/registerForm">Are you a new comer? Click here to register.</a></label>
</body>
</html>
