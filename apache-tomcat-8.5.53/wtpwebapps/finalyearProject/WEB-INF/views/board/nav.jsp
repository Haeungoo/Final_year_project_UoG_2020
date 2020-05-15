<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link href="../resources/css/board/list.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	li{list-style: none; display:inline; padding: 20px; font-size:120%;}
</style>
<nav class="navbar navbar-expand-sm">
<ul class="navbar-nav">
	<li class="nav-item"><a class="nav-link" href="/board/list">List</a></li>
	<li class="nav-item"><a class="nav-link" href="/board/writeView">Write</a></li>
	<li class="nav-item"><a class="nav-link" href="/chat/chatList?userId=${member.userId}&role=${member.userRole}">Chat</a></li>
	<c:if test="${member.userId == 'sys' && member.userId != null }">
	<li class="nav-item"><a class="nav-link" href="/member/admin">Admin</a></li>
	</c:if>
	<c:if test="${member.userId != 'sys' && member.userId != null }">
	<li class="nav-item"><a class="nav-link" href="/member/profile?userId=${member.userId}&role=${member.userRole}">Profile</a></li>
	</c:if>
	<li class="nav-item">
		<c:if test="${member != null}"><a class="nav-link" href="/member/logout">Logout</a></c:if>
		<c:if test="${member == null}"><a class="nav-link" href="/">Login</a></c:if>
	</li>
	<li class="nav-item">
		<c:if test="${member != null}">
			<p><a class="nav-link" href="/member/profile">Hello, ${member.userId}</a></p>
		</c:if>
	</li>
</ul>
</nav>