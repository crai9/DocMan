<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<html>
<head>
	<title>Register Page</title>
</head>
<body>
	<form method="POST" action="register">
		First Name: <input type="text" name="fname"><br>
		Last Name:	<input type="text" name="lname"><br>
		Email:		<input type="email" name="email"><br>
		Username:	<input type="text" name="username"><br>
		Password:	<input type="password" name="password"><br> 
		Confirm Password: <input type="password" name="cpassword"><br>
		<input type="submit" name="submit" value="Register User">
	</form>
</body>
</html>
