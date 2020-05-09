<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:forEach items="${messages}" var="message"><br/>
	<div> 
			<input type="hidden" class="mno" value="${message.mno}"/>
			<c:out value="${message.user1}"/><br/>
			<c:out value="${message.content}"/> &nbsp; &nbsp; &nbsp; &nbsp;
			<p id='date' style='display:inline'><fmt:formatDate value="${message.senddate}" pattern="yy-MMM-dd HH:mm:ss"/></p>
		</div>
	</c:forEach>