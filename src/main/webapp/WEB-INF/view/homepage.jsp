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
			<a href="/manage" class="navbar-brand">Admin</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/approve">Approve</a></li>
					<li><a href="/manage">Manage</a></li>
					<li><a href="/welcome">sign out</a></li>
				</ul>
			</div>
		</div>
	</div>

<%--	<div class="container" id="homediv">
		<div class="jumbotron text-center">
			<h1>Welcome to ebook</h1>
			<h3>**************</h3>
		</div>
	</div> 
	this pageeee --%>

	<div class="container text-centered">
		<div class="alert alert-success">
			<h4>To Edit role,Delete Users please navigate to Manage users</h4>
			<h4>To approve books waiting to be published,move to Aprrove</h4>
		</div>
	</div>
	
	<c:choose>
	<c:when test="${mode=='ALL_USERS' }">
			<div class="container text-center" id="tasksDiv">
				<h3>All Users</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>UserName</th>
								<th>password</th>
								<th>role</th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${users }">
								<tr>
									<td>${user.id}</td>
									<td>${user.username}</td>
									<td>${user.password}</td>
									<td>${user.role}</td>
									<td><a href="/delete-user?id=${user.id }"><span
											class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-user?id=${user.id }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		
		<c:when test="${mode=='MODE_UPDATE' }">
			
					<div class="container text-center">
				<h3>Update User</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-users">
					<input type="hidden" name="id" value="${user.id }" />
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${user.password }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Role</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="role"
								value="${user.role }" />
						</div>
					</div>
					

					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Update" />
					</div>
				</form>
			</div>
		</c:when>
		
		<c:when test="${mode=='ALL_BOOKS' }">
			<div class="container text-center" id="tasksDiv">
				<h3>All Books for approval</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>BookName</th>
								<th>AuthorName</th>
								<th>view</th>
								<th>Approve</th>
								<th>Reject</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="book" items="${books }">
							<c:if test="${book.editor=='true'}">
								<tr>
									<td>${book.id}</td>
									<td>${book.bookname}</td>
									<td>${book.author}</td>
									<td><a href="/view-book?id=${book.id }"><span
											class="glyphicon glyphicon-download-alt"></span></a></td>
									<td><a href="/approve-book3?id=${book.id }"><span
											class="glyphicon glyphicon-thumbs-up"></span></a></td>
									<td><a href="/reject-book3?id=${book.id }"><span
											class="glyphicon glyphicon-thumbs-down"></span></a></td>
								</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>s
					</c:when>
		</c:choose>
	

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>