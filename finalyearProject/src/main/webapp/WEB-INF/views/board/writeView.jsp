<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="shortcut icon" type="image/png" href="../resources/images/pengsu.PNG"/>
	<link href="../resources/css/board/list.css" rel="stylesheet" type="text/css">
	<link href="../resources/css/board/list.css" rel="stylesheet" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
		
	<title>Board</title>
	</head>
	<script type="text/javascript">
	// Validation check (https://melonpeach.tistory.com/26?category=806570)
	$(document).ready(function(){
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click",function(){ 
			if($(".invalid-feedback").is(":visible")){
				return false;
			}
			formObj.attr("action","/board/write");
			formObj.attr("method","post");
			formObj.submit();
		});
		fn_addFile();
	})
	
	function fn_addFile(){
		var fileIndex = 1;
		$(".fileAdd_btn").on("click", function(){
			$("#fileIndex").append("<div><input type='file' name='file_" + (fileIndex++)+"'/>"+"<button class='btn btn-danger' type='button' id='fileDelBtn'>"+"Delete"+"</button></div><br/>");
		});
		$(document).on("click", "#fileDelBtn", function(){
			$(this).parent().remove();
		});
	}
	</script>
	<body>
		<div class="container">
			<header>
				<h1><a href="/board/list">Board</a></h1>
			</header>
			<hr/>
		
			<div>
				<%@include file="nav.jsp"%>
			</div> 
			<hr/>
			
			<section id="container">
				<form name="writeForm" method="post" action="/board/write" enctype="multipart/form-data" class="was-validated">		
					<c:if test="${member.userId != null}">
					<div class="form-group">
						<label for="title" class="col-sm-2 control-label">Title</label>
						<input type="text" id="title" name="title" class="form-control" placeholder="Enter the title" required/>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Insert the title.</div>
					</div>
					<div class="form-group">
						<label for="content" class="col-sm-2 control-label">Content</label>
						<textarea id="content" name="content"  class="form-control" placeholder="Enter the content" required></textarea>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Insert the content.</div>
					</div>
					<div class="form-group">
						<label for="writer" class="col-sm-2 control-label">Writer</label>
						<input type="text" id="writer" name="writer" class="form-control" value="${member.userId}" readonly="readonly"/>
					</div>
					
					<div id="fileIndex">
					</div>
						
					<div class="form-group">
						<button class="write_btn btn btn-success" type="submit">Submit</button>
						<button class="fileAdd_btn btn btn-secondary" type="button">Add files</button>
					</div>
					</c:if>
					<c:if test="${member.userId == null}">
						<p>You can write it after login</p>
					</c:if>
				</form>
			</section>
			<hr/>
		</div>
	</body>
</html>
