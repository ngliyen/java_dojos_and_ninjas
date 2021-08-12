<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>New Dojo</title>
	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container w-50 mt-5 border border-dark border-2 p-5">
<%-- 		<c:out value="${error}"></c:out> --%>
		<h1 class="mb-3">New Dojo</h1>
		<form:form class="w-50" action="/dojos" method="post" modelAttribute="dojo">
			<p class="d-flex">
				<form:label class="form-label col" path="name">Name</form:label>
				<form:errors class="text-danger col" path="name"/>
				<form:input class="form-control col" path="name"/>
			</p>
			<div class="d-flex justify-content-end">
				<input class = "w-25 btn btn-dark" type="submit" value="Create"/>
			</div>
		</form:form>
	</div>
</body>
</html>