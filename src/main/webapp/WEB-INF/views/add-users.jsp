<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<html>
<head>
	<title>Register Page</title>
</head>
<body>
	<a href="listAll">Back to list</a>
	<form method="POST" action="register" onsubmit="return validatePassword()">
		<h3 style="color: red;" id="message"></h3>
		First Name: <input type="text" name="fname"><br>
		Last Name:	<input type="text" name="lname"><br>
		Email:		<input type="email" name="email"><br>
		Username:	<input id="username" type="text" name="username"><br>
		Password:	<input id="p1" type="password" name="password"><br> 
		Confirm Password: <input id="p2" type="password" name="cpassword"><br>
		<input type="submit" name="submit" value="Register User">
	</form>
	<script src="resources/js/main.js"></script>
</body>
</html>
