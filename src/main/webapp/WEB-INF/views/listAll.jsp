<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
	<title>List of users</title>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/css/formValidation.min.css" rel="stylesheet">
	<link href="resources/css/global.css" rel="stylesheet">
</head>
<body>
<%@ include file="menu.jsp" %>
<h3>Persons List</h3>
<h4><a href="<c:url value='/registerPage' />">Add new</a></h4>
<c:choose>
<c:when test="${!empty list}">
	<form id="search"">
	<input id="query" type="text" name="search" class="form-control" placeholder="Search for users..."/>
	<button type="submit" class="btn btn-default" >Search</button>
	</form>
	<div class="table-responsive">
	<table border="1" class="table">
	<tr class="active">
		<th width="80">UserId</th>
		<th width="120">Username</th>
		<th width="120">First Name</th>
		<th width="120">Last Name</th>
		<th width="120">Email</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${list}" var="user">
		<tr>
			<td>${user.id}</td>
			<td class="success">${user.username}</td>
			<td>${user.firstName}</td>
			<td>${user.lastName}</td>
			<td>${user.email}</td>
			<td><a href="<c:url value='/user/edit/${user.id}' />" >Edit</a></td>
			<td><a href="#" onclick="confirmDelete(${user.id})">Delete</a></td>
		</tr>
	</c:forEach>
	</table>
	</div>
</c:when>
<c:otherwise>
<h4 style="color: red;">No results!</h4>
</c:otherwise>
</c:choose>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/resources/js/main.js' />"></script>
</body>
</html>