<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<title>chatList</title>

</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="<c:url value="../resources/js/sockjs-0.3.4.js"/>"></script>

<body>
	<div class="container">
		<header>
			<h1><a href="../board/list">Board</a></h1>
		</header>
		<hr />
			
		<div>
			<%@include file="../board/nav.jsp"%>
		</div> 
		<hr/>
		
		<script type="text/javascript">
    
    $(document).ready(function() {
   
        $("#cancelBtn").on("click",function(){
			location.href = "../board/list";
			
		});
    
        
    });
    
    
    
</script>
		
		<form action="/chat/chatList" method="post">
			
		  	<table class="table table-hover">
				<thead>
				<tr><th>User1</th><th>User2</th><th>Status</th></tr>
				</thead>
				<tbody>
				<c:forEach items="${chatList}" var="chatList" varStatus="status">
						
				<tr>
									
					<c:set var="userId" value='<%=request.getParameter("userId") %>'/>
					<c:set var="role" value='<%=request.getParameter("role") %>'/>
					<c:set var="cno" value="${chatList.cno}"/>
					<c:set var="user2" value="${chatList.user2}"/>
					<c:if test="${ userId == user2 }">
						<c:set var="user2" value="${chatList.user1}"/>
					</c:if>
					<td><c:out value="${chatList.user1}" /></td>
					<td><c:out value="${chatList.user2}" /></td>
					<td><a href="/chat/chatView2?cno=${cno}&sender=${userId}&user2=${user2}">
					<input type="button" class="btn btn-success" value="Start Chat"/></a></td>		
				</tr>
			</c:forEach>
			</tbody>
		</table>	  	
	  	</form>
	  	 	<input type="button" id="cancelBtn" class="btn btn-danger" value="Exit" />	
		<hr/>
	</div>
</body>
</html>