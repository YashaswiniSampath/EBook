<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>Ebook</title>
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
			<a href="/user" class="navbar-brand">USER</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/viewbooks">View Books</a></li>
					<li><a href="/welcome">logout</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	

<c:choose>
		<c:when test="${mode=='MODE_USER'}">
		
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Welcome User</h1>
					<h3>***</h3>
				</div>
			</div>
			</c:when>
			
			<c:when test="${mode=='VIEW_BOOK' }">
			<div class="container text-center" id="tasksDiv">
				<h3>View Book</h3>
				<hr>
				<p>Choose Category of books you require to read"<p>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
							    <th>Category ID</th>
								<th>Category avavilable</th>
							</tr>
						</thead>
				<c:forEach var="cat" items="${cats }">
				<tr>
				   <td>${cat.cid}</td>
				   <td>${cat.category}</td>
				  </tr>
				  </c:forEach>
				  	</tbody>
					</table>  
					<p> enter the category you want to read</p>
					<form class="form-horizontal"  method="GET" action="view-books" />
					<div class="form-group">
						<label class="control-label col-md-3">Category</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="Cid"
								value="${cat.Cid}" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Submit" />
					</div>
				
				</c:when>
				<c:when test="${mode=='VIEW_BOOKS' }">	
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>BookName</th>
								<th>Author</th>
								<th>ViewBook</th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach var="book" items="${books }">
							 
								<tr>
									<td>${book.bookname}</td>
									<td>${book.author}</td>
									<td><a href="/view-bookss?id=${book.id}"><span
											class="glyphicon glyphicon-download-alt"></span></a></td>
								</tr>
						
						 </c:forEach>
						
						</tbody>
					</table>
				
			</div>
		</c:when>
			</c:choose>
				
		
			</body>
			</html>