<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
li {
	list-style: none;
	display: inline;
	padding: 50px;
}
</style>
</head>
<body>
	<div class="container">
		<div>
			<header>
				<h1>
					<a href="/board/list">Board</a>
				</h1>
			</header>
		</div>
		<hr />
		<div>
			<ul>
				<li><a href="/member/admin">Member</a></li>
				<li><a href="/member/report">Report</a></li>
			</ul>
		</div>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>Reported UserId</th>
					<th>Reported Reason</th>
					<th>Title</th>
					<th>Writer</th>
					<th>Date</th>
					<th>Views</th>
				</tr>
			</thead>

			<c:forEach items="${reportedPostList}" var="reportedPostList">
				<tr>
					<td><c:out value="${reportedPostList.userId}"/></td>
					<td><c:out value="${reportedPostList.reason}"/></td>
					<td><a href="/board/readView?bno=${reportedPostList.bno}"><c:out
								value="${reportedPostList.title}" /></a></td>
					<td><c:out value="${reportedPostList.writer}" /></td>
					<td><fmt:formatDate value="${reportedPostList.regdate}"
							pattern="dd-MM-yyyy" /></td>
					<td><c:out value="${reportedPostList.hit}" /></td>
				</tr>
			</c:forEach>
		</table>

	</div>
</body>
</html>