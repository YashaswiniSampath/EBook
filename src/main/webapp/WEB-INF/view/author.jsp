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
			<a href="/author" class="navbar-brand">Author</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/addbooks">Add Books</a></li>
					<li><a href="/addcategory">Add Category</a></li>
					<li><a href="/welcome">logout</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	

<c:choose>
		<c:when test="${mode=='MODE_AUTHOR'}">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Welcome Author</h1>
					<h3>***</h3>
				</div>
			</div>
			</c:when>
			
		<c:when test="${mode=='MODE_ADDBOOK' }">
			<div class="container text-center">
				<h3>Add New Book</h3>
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
						<tbody>
			              <c:if test="${true}">
				           <c:forEach var="cat" items="${cats }">
					        <tr>
				 		        <td>${cat.cid}</td>
				 		        <td>${cat.category}</td>
				 		      </tr>
				 	      </c:forEach>
				      </c:if>
				       </tbody>
					</table>  
				<form class="form-horizontal" method="POST" action="save-book">
					<input type="hidden" name="id" value="${Book.id }" />
					<div class="form-group">
						<label class="control-label col-md-3">BookName</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="bookname"
								value="${book.Bookname }" />
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="control-label col-md-3">Author</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="author"
								value="${book.author }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Choose Category</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="category"
								value="${book.category }" />
						</div>
					</div>
					<div  class="form-group ">
					<br>
					 <lable class="control-label col-md-3"><b> file content:</b></lable>
					 <div class="col-md-7">
					 <textarea name="paragraph_text" cols="50" rows="10" class="form-control" name="file" value="${book.file }"></textarea>
					  
					</div>
					</div>  
					
					
					
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="addbook" />
					</div>
				</form>
			</div>
		</c:when>
		
		
		<c:when test="${mode=='MODE_ADDCATEGORY' }">
			<div class="container text-center">
				<h3>Add New Category</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-categorys">
		
					<div class="form-group">
						<label class="control-label col-md-3">Category Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="category"
								value="${cat.category }" />
						</div>
					</div>			
				<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="addcategory" />
					</div>
				</form>
			</div>
		</c:when>
			
	
	</c:choose>
</body>
</html>
