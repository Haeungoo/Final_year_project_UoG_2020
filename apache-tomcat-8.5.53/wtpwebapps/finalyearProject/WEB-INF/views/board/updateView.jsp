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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>	 	
	<title>Board</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(document).on("click", "#fileDel", function(){
				$(this).parent().remove();
			})
			
			fn_addFile();
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/readView?bno=${update.bno}"
						+"&page=${scri.page}"
						+"&perPageNum=${scri.perPageNum}"
						+"&searchType=${scri.searchType}"
						+"&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if($(".invalid-feedback").is(":visible")){
					return false;
				}
				formObj.attr("action","/board/update");
				formObj.attr("method","post");
				formObj.submit();
			})
		})
		function fn_addFile(){
			var fileIndex = 1;
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' name='file_"+(fileIndex++)+"'/>"+"<button class='btn btn-danger' type='button' id='fileDelBtn'>"+"Delete"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
			});
		}
		var fileNoArry = new Array();
		var fileNameArry = new Array();
		function fn_del(value, name){
			fileNoArry.push(value);
			fileNameArry.push(name);
			$("#fileNoDel").attr("value", fileNoArry);
			$("#fileNameDel").attr("value", fileNameArry);
		}	
	</script>
	<body>
	
		<div class="container">
			<header>
				<h1><a href="/board/list">Board</a></h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp"%>
			</div> 
			<hr />
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/update" enctype="multipart/form-data" class="was-validated">
					<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
					<input type="hidden" id="page" name="page" value="${scri.page}"/>
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"/>
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"/>
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"/>
					<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""/>
					<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""/>
					
					<div class="form-group">
						<label for="title" class="col-sm-2 control-label">Title</label>
						<input type="text" id="title" name="title" class="form-control" value="${update.title}" required/>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Insert the title.</div>
					</div>
					<div class="form-group">
						<label for="content" class="col-sm-2 control-label">Content</label>
						<textarea id="content" name="content" class="form-control" required><c:out value="${update.content}"/></textarea>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Insert the content.</div>
					</div>
					<div class="form-group">
						<label for="writer" class="col-sm-2 control-label">Writer</label>
						<input type="text" id="writer" name="writer" class="form-control" value="${update.writer}" readonly="readonly"/>
					</div>
					<div class="form-group">
						<label for="regdate" class="col-sm-2 control-label">Date</label>
						<fmt:formatDate value="${update.regdate}" pattern="dd-MM-yyyy"/>						
					</div>
				
					<div id="fileIndex">
						<c:forEach var="file" items="${file}" varStatus="var">
							<div>	
								<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO}"/>
								<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}"/>
								<button id="fileDel" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">Delete</button><br>
							</div>
						</c:forEach>
					</div>
					
					<div>
						<button type="submit" class="update_btn btn btn-success">Save</button>
						<button type="button" class="cancel_btn btn btn-danger">Cancel</button>
						<button type="button" class="fileAdd_btn btn btn-secondary">Add files</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>
 