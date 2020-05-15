<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="shortcut icon" type="image/png" href="../resources/images/pengsu.PNG"/>
<link href="../resources/css/board/list.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>	
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
	li{list-style: none; display:inline; padding: 50px;}
</style>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	$(".delete").on("click", function(){
		location.href = "../member/memberDeleteView";
	});
	$('[data-toggle="tooltip"]').tooltip();
})
</script>
<div class="container">
	<div>
	<header>
		<h1><a href="/board/list" data-toggle="tooltip" data-placement="right" title="Press it if you want to go to the bulletin board">Board</a></h1>
	</header>
	</div>
	<hr/>
	<div>
	<ul>
		<li><a href="/member/admin">Member</a></li>
		<li><a href="/member/report">Report</a></li>
	</ul>
	</div>
	<section id="container">
			<form role="form" method="get">
			
				<table class="table table-hover">
					<thead>
					<tr><th>UserID</th><th>UserPW</th><th>UserRole</th><th>Regdate</th></tr>
					</thead>
					
					<c:forEach items="${memberList}" var ="memberList">
						<tr>
							<td><c:out value="${memberList.userId}"/></td>
							<td><c:out value="${memberList.userPw}"/></td>
							<td><c:out value="${memberList.userRole}"/></td>
							<td><fmt:formatDate value="${memberList.regDate}" pattern="dd-MM-yyyy"/></td>
							
						</tr>
					</c:forEach>					
				</table>				
			</form>
	</section>
</div>
</body>
</html>