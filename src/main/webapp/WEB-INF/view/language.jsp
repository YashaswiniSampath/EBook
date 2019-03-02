<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>tecno-tab | home</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/language" class="navbar-brand">Language Expert</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/bookpresent">Approve Books</a></li>
					<li><a href="/welcome">logout</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	

<c:choose>
		<c:when test="${mode=='MODE_LANGUAGE'}">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Welcome Language Expert</h1>
					<h3>***</h3>
				</div>
			</div>
			</c:when>
			
			<c:when test="${mode=='ALL_BOOKPRESENT' }">
			<div class="container text-center" id="tasksDiv">
				<h3>All Books for approval</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>BookName</th>
								<th>Author</th>
								<th>ViewBook</th>
								<th>Approve</th>
								<th>Reject</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="book" items="${books }">
							<c:if test="${book.publishstatus=='true'}">
								<tr>
									<td>${book.id}</td>
									<td>${book.bookname}</td>
									<td>${book.author}</td>
									<td><a href="/view-book?id=${book.id }"><span
											class="glyphicon glyphicon-download-alt"></span></a></td>
									<td><a href="/approve-book1?id=${book.id }"><span
											class="glyphicon glyphicon-thumbs-up"></span></a></td>
									<td><a href="/reject-book1?id=${book.id }"><span
											class="glyphicon glyphicon-thumbs-down"></span></a></td>
								</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		
			</c:choose>
			</body>
			</html>