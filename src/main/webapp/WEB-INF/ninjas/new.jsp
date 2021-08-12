<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>New Ninja</title>
	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container w-50 mt-5 border border-dark border-2 p-5">
		<h1 class="mb-3">New Ninja</h1>
		<form:form class="w-100" action="/ninjas" method="post" modelAttribute="ninja">
			<p class="d-flex">
				<form:label class="form-label col" path="dojo.id">Dojo:</form:label>
				<form:errors class="text-danger col" path="dojo.id"/>
				<form:select class="form-select col" path="dojo.id">
					<c:forEach var="dojo" items="${dojos}">
						<form:option value="${dojo.id}"><c:out value="${dojo.name}"/></form:option>
					</c:forEach>
				</form:select>
			</p>
			<p class="d-flex">
				<form:label class="form-label col" path="firstName">First Name:</form:label>
				<form:errors class="text-danger col" path="firstName"/>
				<form:input class="form-control col" path="firstName"/>
			</p>
			<p class="d-flex">
				<form:label class="form-label col" path="lastName">Last Name:</form:label>
				<form:errors class="text-danger col" path="lastName"/>
				<form:input class="form-control col" path="lastName"/>
			</p>
			<p class="d-flex">
				<form:label class="form-label col" path="age">Age:</form:label>
				<form:errors class="text-danger col" path="age"/>
				<form:input type="number" class="form-control col" path="age"/>
			</p>
			<div class="d-flex justify-content-end">
				<input class = "btn btn-dark" type="submit" value="Create"/>
			</div>
		</form:form>
	</div>
</body>
</html>