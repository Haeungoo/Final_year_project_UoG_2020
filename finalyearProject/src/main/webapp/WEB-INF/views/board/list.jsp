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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="shortcut icon" type="image/png" href="../resources/images/pengsu.PNG"/>
<link href="../resources/css/board/list.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
});
</script>
<title>Board</title>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>
				<a href="/board/list" data-toggle="tooltip" data-placement="right" title="Press it if you want to go to the bulletin board">Board</a>
			</h1>
		</div>
		<div>
			<%@include file="nav.jsp"%>
		</div>
		<hr />

<section id="container">
	<form role="form" method="get">
		<table class="table table-hover">
			<thead>
				<tr>
					<th><a href="" data-toggle="tooltip" data-placement="top" title="Click the title if you want to read the post">Title</a></th>
					<th><a href="" data-toggle="tooltip" data-placement="top" title="Click the writer's name if you want to start chatting">Writer</a></th>
					<th>Date</th>
					<th>Views</th>
					<th>Like</th>
				</tr>
			</thead>
	
			<c:forEach items="${list}" var="list">
				<tr>
					<!-- <td><c:out value="${list.bno}"/></td> -->
					<c:if test="${list.bno != 0}">
					<td>
						<a href="/board/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&role=${scri.role}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.title}"/></a>
					</td>
					<c:if test="${member.userId != list.writer}">
						<td><a href="/chat/chatView?writer=${list.writer}&member=${member.userId}&role=${member.userRole}"><c:out value="${list.writer}" /></a></td>
					</c:if>
					<c:if test="${member.userId == list.writer}">
						<td><c:out value="${list.writer}" /></td>
					</c:if>
					<td><fmt:formatDate value="${list.regdate}" pattern="dd-MM-yyyy" /></td>
					<td><c:out value="${list.hit}" /></td>
					<td><c:out value="${list.heart}" /></td>
					</c:if>
				</tr>
			</c:forEach>
			
	
		</table>
		<div class="search row">
			<div class="col-xs-2 col-sm-2">
				<select name="role" class="form-control">
					<option value="n" <c:out value="${scri.role == null ? 'selected' : ''}"/>>-----</option>
					<option value="starter" <c:out value="${scri.role eq 'starter' ? 'selected' : ''}"/>>Starter(Question)</option>
					<option value="adopter" <c:out value="${scri.role eq 'adopter' ? 'selected' : ''}"/>>Adopter(Solution)</option>
				</select>
			</div>
			<div class="col-xs-2 col-sm-2">	
				<select name="searchType" class="form-control">
					<option value="n" <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
					<option value="t" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>Title</option>
					<option value="c" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>Content</option>
					<option value="w" <c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>Writer</option>
					<option value="tc" <c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>Title+Content</option>
				</select>
			</div>
	
			<div class="col-xs-6 col-sm-6">
				<div class="input-group">
					<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control" /> 
					<span class="input-group-btn">
							<button id="searchBtn" type="button" class="searchBtn btn btn-success">Search</button>
							<a href="" data-toggle="tooltip" data-placement="right" title="If you select Both, Writer, 'Greenwich', it shows the posts whose writer is Greenwich among posts."><i class="fas fa-bars"></i></a>
					</span>
				</div>
			</div>
	
			<script>
				$(function() {
					$('#searchBtn').click(function() {
						self.location = "list" + '${pageMaker.makeQuery(1)}'
												+ "&role=" + $("select[name=role] option:selected").val()
												+ "&searchType="+ $("select[name=searchType] option:selected").val()
												+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
						});
				
				});
			</script>
	</div>
	
		<div class="col-md-offset-3">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a href="list${pageMaker.makeSearch(pageMaker.startPage-1)}">Previous</a></li>
				</c:if>
	
				<c:forEach begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}" var="idk">
					<li
						<c:out value="${pageMaker.cri.page == idk? 'class=info' : ''}" />>
						<a href="list${pageMaker.makeSearch(idk)}">${idk}</a>
					</li>
				</c:forEach>
	
				<c:if test="${pageMaker.next && pageMaker.endPage>0}">
					<li><a
						href="list${pageMaker.makeSearch(pageMaker.endPage+1)}">Next</a></li>
				</c:if>
			</ul>
		</div>
	</form>
</section>
</div>
</body>


</html>