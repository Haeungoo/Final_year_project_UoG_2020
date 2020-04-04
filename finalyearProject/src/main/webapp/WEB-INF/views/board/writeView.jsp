<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Board</title>
</head>
<body>
	<div id="root">
		<header>
			<h1>Board</h1>
		</header>
	<hr/>
	
	<nav>
	Home - Post
	</nav>
	<hr/>
	
	<section id="container">
		<form role="form" method="post" action="board/write">
			<table>
				<tbody>
					<tr>
						<td>
							<label for="title">Title</label><input type="text" id="title" name="title"/> 
						</td>
					</tr>
					<tr>
						<td>
							<label for="content">Content</label><textarea id="content" name="content"></textarea>
						</td>
					</tr>	
					<tr>
						<td>
							<label for="writer">Writer</label><input type="text" id="writer" name="writer"/>
						</td>
					</tr>
					<tr>					
						<td>
							<button type="submit">Submit</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</section>
	<hr/>
</div>
</body>

</html>
