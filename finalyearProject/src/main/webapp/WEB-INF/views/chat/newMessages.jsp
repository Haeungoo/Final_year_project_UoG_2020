<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:forEach items="${messages}" var="message"><br/> 
<c:set var="sender" value='<%=request.getParameter("sender")%>'/>
<c:if test="${sender != message.user1 }">
<div class="chat-message other">
	<section><i class="fa fa-user"></i></section>
	<input type="hidden" class="mno" value="${message.mno}"/>
	<span id="user"><c:out value="${message.user1}"/></span><br/>
	<div id="content"><c:out value="${message.content}"/></div> &nbsp; &nbsp; &nbsp; &nbsp;
	<p id='date' style='display:inline'><fmt:formatDate value="${message.senddate}" pattern="HH:mm"/></p>
	<c:set var="senddate" value="${message.senddate}"/>
</div>
</c:if>
<c:if test="${sender == message.user1 }">
<div class="chat-message mine">
	<section><i class="fa fa-user"></i></section>
	<input type="hidden" class="mno" value="${message.mno}"/>
	<span id="user"><c:out value="${message.user1}"/></span><br/>
	<p id='date' style='display:inline'><fmt:formatDate value="${message.senddate}" pattern="HH:mm"/></p>
	<div id="content"><c:out value="${message.content}"/></div>
</div>
</c:if>
</c:forEach>