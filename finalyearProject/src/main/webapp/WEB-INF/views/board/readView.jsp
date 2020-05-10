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
<link href="../resources/css/board/list.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>Board</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 23px;
  right: 28px;
  width: 280px;
}

/* The popup form - hidden by default */
.form-popup {
  display: none;
  position: fixed;
  bottom: 0;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px;
  padding: 10px;
  background-color: white;
}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
</style>
</head>

<script type="text/javascript">
//Validation check (https://melonpeach.tistory.com/26?category=806570)
$(document).ready( function() {
	var formObj = $("form[name='readForm']");

	// update 
	$(".update_btn").on("click", function() {
		formObj.attr("action", "/board/updateView");
		formObj.attr("method", "get");
		formObj.submit();
	});

	// delete
	$(".delete_btn").on("click", function() {
		var deleteYN = confirm("Are you want to delete it?");

		if (deleteYN == true) {

			formObj.attr("action", "/board/delete");
			formObj.attr("method", "post");
			formObj.submit();

		}
	});

	// list
	$(".list_btn").on("click", function() {
		location.href = "/board/list?page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
	});

	// list
	$(".save_btn").on("click", function() {
		if ("${member.userId}" == undefined
				|| "${member.userId}" == "") {
			alert("Please login to save the post");
			return;
		}
		var data = {};
		data['userId'] = "${member.userId}";
		data['bno'] = "${read.bno}";
		$.ajax({
					url : "/member/profileSave",
					type : "POST",
					dateType : "json",
					data : data,
					success : function(data) {
						if (data) {
							alert("The post is saved in your profile.");
							location.href = "/member/profile";
						} else {
							alert("You have already saved this post.");
						}
					}
				});

	});

	// list
	$(".report_btn").on("click", function() {
		if ("${member.userId}" == undefined
				|| "${member.userId}" == "") {
			alert("Please login to report the post");
			return;
		}

		var data = {};
		data['userId'] = "${member.userId}";
		data['bno'] = "${read.bno}";
		data['reason'] = document.getElementById("reason").value;
		$.ajax({
					url : "/member/memberReport",
					type : "POST",
					dateType : "json",
					data : data,
					success : function(data) {
						if (data) {
							alert("The post is reported to the Administrator.");
							location.href = "/board/list";
						} else {
							alert("You have already reported this post.");
						}
					}
				});

	});
	
	// list
	$(".like_btn").on("click", function() {
		if ("${member.userId}" == undefined || "${member.userId}" == "") {
			alert("Please login to like the post");
			return;
		}
		formObj.attr("action", "/board/like");
		formObj.attr("method", "post");
		formObj.submit();
	

	});

	// comment 
	$(".commentWriteBtn").on("click", function() {
		if($(".invalid-feedback").is(":visible")){
			return false;
		}
		var formObj = $("form[name='commentForm']");
		formObj.attr("action", "/board/commentWrite");
		formObj.submit();
	});

	//Commit Update View
	$(".commentUpdateBtn").on("click", function() {
		location.href = "/board/commentUpdateView?bno=${read.bno}"
				+ "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}"
				+ "&rno="
				+ $(this).attr("data-rno");
	});

	//Comment Delete View
	$(".commentDeleteBtn").on("click", function() {
		location.href = "/board/commentDeleteView?bno=${read.bno}"
				+ "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}"
				+ "&rno="
				+ $(this).attr("data-rno");

	});
})

function fn_fileDown(fileNo) {
	var formObj = $("form[name='readForm']");
	$("#FILE_NO").attr("value", fileNo);
	formObj.attr("action", "/board/fileDown");
	formObj.submit();
}

function openForm() {
	  document.getElementById("myForm").style.display = "block";
}

function closeForm() {
	  document.getElementById("myForm").style.display = "none";
}
</script>

<body>

	<div class="container">
		<header>
			<h1>
				<a href="/board/list">Board</a>
			</h1>
		</header>
		<hr />
		<div>
			<%@include file="nav.jsp"%>
		</div>
		<hr />

		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" /> <input
					type="hidden" id="page" name="page" value="${scri.page}" /> <input
					type="hidden" id="perPageNum" name="perPageNum"
					value="${scri.perPageNum}" /> <input type="hidden" id="searchType"
					name="searchType" value="${scri.searchType}" /> <input
					type="hidden" id="keyword" name="keyword" value="${scri.keyword}" />
				<input type="hidden" id="FILE_NO" name="FILE_NO" value="" />
			</form>

			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">Title</label> <input
					type="text" id="title" name="title" class="form-control"
					value="${read.title}" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="content" class="col-sm-2 control-label">Content</label>
				<textarea id="content" name="content" class="form-control"
					readonly="readonly"><c:out value="${read.content}" /></textarea>
			</div>
			<div class="form-group">
				<label for="writer" class="col-sm-2 control-label">Writer</label> <input
					type="text" id="writer" name="writer" class="form-control"
					value="${read.writer}" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="regdate" class="col-sm-2 control-label">Date</label>
				<fmt:formatDate value="${read.regdate}" pattern="dd-MM-yyyy" />
			</div>
			<hr>
			<span>List of files</span>
			<div class="form-group" style="border: 1px solid #dbdbdb;">
				<c:forEach var="file" items="${file}">
					<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
				</c:forEach>
			</div>
			<hr>
			<div>
				<c:if
					test="${member.userId == read.writer || member.userId == 'sys'}">
					<button type="button" class="update_btn btn btn-light">Update</button>
					<button type="button" class="delete_btn btn btn-danger">Delete</button>
				</c:if>

				<button type="button" class="list_btn btn btn-light">List</button>
				<button type="button" class="save_btn btn btn-light">Save</button>
				<button type="button" class="btn btn-light" onclick="openForm()">Report</button>
				<button type="button" class="like_btn btn btn-light"><i class="fas fa-heart"> Like</i></button>

				<div class="form-popup" id="myForm">
					<form class="form-container">
						<input type="hidden" value="${member.userId}" name="userId" readonly="readonly">
						<input type="hidden" value="${read.bno}" name="bno" readonly="readonly">						
						<label for="reason"><b>Reason</b></label> 
						<input type="text" placeholder="Please write down the reason for reporting the post" id="reason" name="reason">
						<button type="button" class="report_btn btn">Send</button>
						<button type="button" class="btn cancel" onclick="closeForm()">Close</button>
					</form>
				</div>
			</div>

			<!-- comment -->
			<div class="container" id="comment">
				<ol class="commentList">
					<c:forEach items="${commentList}" var="commentList">
						<li style="padding-top: 0px; margin-top: 50px">
							<p>
								Writer: ${commentList.writer}<br /> Date:
								<fmt:formatDate value="${commentList.regdate}"
									pattern="dd-MM-yyyy" />
							</p>

							<p>${commentList.content}</p>
							<div>
								<c:if
									test="${member.userId == commentList.writer || member.userId == 'sys'}">
									<button type="button" class="commentUpdateBtn btn btn-primary"
										data-rno="${commentList.rno}">Update</button>
									<button type="button" class="commentDeleteBtn btn btn-danger"
										data-rno="${commentList.rno}">Delete</button>
								</c:if>
							</div>
						</li>
					</c:forEach>
				</ol>
			</div>

			<form name="commentForm" method="post" class="was-validated">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" /> 
				<input type="hidden" id="page" name="page" value="${scri.page}" /> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" /> 
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" /> 
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" />
				
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">Comment writer</label>
					<div class="col-sm-10">
						<input type="text" id="writer" name="writer" value="${member.userId}" readonly="readonly" class="form-control" />
					</div>
				</div>

				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">Comment content</label>
					<div class="col-sm-10">
						<input type="text" id="content" name="content" placeholder="Enter the comment" class="form-control" required/>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Insert the content.</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="commentWriteBtn btn btn-success">Submit</button>
					</div>
				</div>
			</form>
		</section>

	</div>
</body>
</html>