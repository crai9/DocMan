<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
	<title>Update Page</title>
</head>
<body>
	<h3>Update User's details</h3>
	<form method="POST" action="postUpdate">
		<input type="hidden" name="userId" value="${user.id}">
		First Name: <input type="text" name="fname" value="${user.firstName}"><br>
		Last Name:	<input type="text" name="lname" value="${user.lastName}"><br>
		Email:		<input type="email" name="email" value="${user.email}"><br>
		Username:	<input type="text" name="username" value="${user.username}"><br>
		<input type="submit" name="submit" value="Update User">
	</form>
</body>
</html>
