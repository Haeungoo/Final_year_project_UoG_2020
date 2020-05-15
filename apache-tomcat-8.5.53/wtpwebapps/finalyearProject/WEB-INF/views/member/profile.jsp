<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="shortcut icon" type="image/png" href="../resources/images/pengsu.PNG"/>
<link href="../resources/css/board/profile.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
		<div>
			<h1>
				<a href="/board/list" data-toggle="tooltip" data-placement="right" title="Press it if you want to go to the bulletin board">Board</a>
			</h1>
		</div>
		<hr />

		<div>
			<%@include file="../board/nav.jsp"%>

		</div>
		<hr />

		<c:if test="${member.userId != null && member.userRole != null}">
    		<div class="col-sm-4">
			<h3>Photo</h3>
			<img src="/resources/images/pengsu.PNG" alt="image" height="200px"
				width="200px" />
			<h3>UserID : ${member.userId}</h3>
			<h3>UserRole : ${member.userRole}</h3>
			</div>
			
			<div class="col-sm-8">
			<h3>Saved Posts</h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Title</th>
						<th>Writer</th>
						<th>Date</th>
						<th>Views</th>
					</tr>
				</thead>

				<c:forEach items="${savedPostList}" var="savedPostList">
					<tr>
						<td><a href="/board/readView?bno=${savedPostList.bno}"><c:out
									value="${savedPostList.title}" /></a></td>
						<td><c:out value="${savedPostList.writer}" /></td>
						<td><fmt:formatDate value="${savedPostList.regdate}"
								pattern="dd-MM-yyyy" /></td>
						<td><c:out value="${savedPostList.hit}" /></td>
					</tr>
				</c:forEach>
			</table>
			
			<br/><br/>
			
			<h3>Your Posts</h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Title</th>
						<th>Writer</th>
						<th>Date</th>
						<th>Views</th>
					</tr>
				</thead>

				<c:forEach items="${yourPostList}" var="yourPostList">
					<tr>
						<td><a href="/board/readView?bno=${yourPostList.bno}"><c:out
									value="${yourPostList.title}" /></a></td>
						<td><c:out value="${yourPostList.writer}" /></td>
						<td><fmt:formatDate value="${yourPostList.regdate}"
								pattern="dd-MM-yyyy" /></td>
						<td><c:out value="${yourPostList.hit}" /></td>
					</tr>
				</c:forEach>
			</table>
			</div>

		</c:if>

		<c:if test="${member.userId == null && member.userRole == null}">
			<p>You can write it after login</p>
		</c:if>
		</div>
	</div>
</body>
</html>