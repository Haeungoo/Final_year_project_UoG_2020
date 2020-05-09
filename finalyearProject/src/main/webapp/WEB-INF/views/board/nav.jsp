<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
	li{list-style: none; display:inline; padding: 50px; font-size:120%;}
</style>

<ul>
	<li><a href="/board/list">List</a></li>
	<li><a href="/board/writeView">Write</a></li>
	<li><a href="/chat/chatList?userId=${member.userId}&role=${member.userRole}">Chat</a></li>
	<c:if test="${member.userId == 'sys' && member.userId != null }">
	<li><a href="/member/admin">Admin</a></li>
	</c:if>
	<c:if test="${member.userId != 'sys' && member.userId != null }">
	<li><a href="/member/profile?userId=${member.userId}&role=${member.userRole}">Profile</a></li>
	</c:if>
	<li>
		<c:if test="${member != null}"><a href="/member/logout">Logout</a></c:if>
		<c:if test="${member == null}"><a href="/">Login</a></c:if>
	</li>
	<li>
		<c:if test="${member != null}">
			<p><a href="/member/profile">Hello, ${member.userId}</a></p>
		</c:if>
	</li>
</ul>
