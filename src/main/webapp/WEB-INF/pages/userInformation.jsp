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
			<%
			String msg = request.getParameter("message");
			out.print(msg != null ? msg : "");
			%>

			<a href="/">create user</a>
			<h1>User Information</h1>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Address</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="u" items="${data.users}">

						<tr>
							<td>${u.id}</td>
							<td>${u.name}</td>
							<td>${u.email}</td>
							<td>${u.address}</td>
							<td>
							
							<a  href="/edit/${u.id}">Edit</a> 
							<a href="/delete/${u.id}">Delete</a>
							
							</td>
						</tr>

					</c:forEach>

				</tbody>


			</table>
		</div>
	</div>
</body>
</html>