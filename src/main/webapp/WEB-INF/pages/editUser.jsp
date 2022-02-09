<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row col-md-6">
			<form action="/update" method="post">
				<h1>User Form</h1>
				
				<input type="hidden" class="form-control" id="id" value="${data.user.id}"
						aria-describedby="idHelp" name="id">
				
				<div class="mb-3">				
					<label for="name" class="form-label">Name</label> <input
						type="text" class="form-control" id="name" value="${data.user.name}"
						aria-describedby="nameHelp" name="name">
				</div>
				<div class="mb-3">
					<label for="email" class="form-label">Email</label> <input
						type="email" class="form-control" id="email" value="${data.user.email}"
						aria-describedby="emailHelp" name="email">
				</div>
				<div class="mb-3">
					<label for="address" class="form-label">address</label> <input
						type="text" class="form-control" id="address" value="${data.user.address}"
						aria-describedby="emailHelp" name="address">
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
			<a href="/show">users</a>
			
		</div>
	</div>
</body>
</html>