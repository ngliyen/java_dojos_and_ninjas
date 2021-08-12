<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Dojo Page</title>
	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container w-50 mt-5 border border-dark border-2 p-5">
		<h1><c:out value="${dojo.name}"/> Ninjas</h1>
<%-- 		<p class="text-danger pt-3 pb-3"><c:out value="${error}"/></p> --%>
		<table class="table">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Age</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ninja" items="${dojo.getNinjas()}">
					<tr class="align-middle">
						<td><c:out value="${ninja.firstName}"></c:out></td>
						<td><c:out value="${ninja.lastName}"></c:out></td>
						<td><c:out value="${ninja.age}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="d-flex justify-content-end gap-2">
			<a class="btn btn-dark" href="/ninjas/new">Add Ninja</a>
			<a class="btn btn-dark" href="/dojos/new">Add Dojo</a>
		</div>
	</div>
</body>
</html>