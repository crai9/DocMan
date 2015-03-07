<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<html>
<head>
	<title>Register Page</title>
</head>
<body>
	<a href="listAll">Back to list</a>
	<form method="POST" action="register">
		First Name: <input type="text" name="fname"><br>
		Last Name:	<input type="text" name="lname"><br>
		Email:		<input type="email" name="email"><br>
		Username:	<input type="text" name="username"><br>
		Password:	<input type="password" name="password"><br> 
		Confirm Password: <input type="password" name="cpassword"><br>
		Admin Role: <input type="checkbox" name="adminRole"><br>
		User Role: <input type="checkbox" name="userRole"><br>
		<input type="submit" name="submit" value="Register User">
	</form>
</body>
</html>
