<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
	<title>Login Page</title>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/css/formValidation.min.css" rel="stylesheet">
	<link href="resources/css/global.css" rel="stylesheet">
</head>
<body>
	<div class="container top">
	<div class="page-header">
  		<h1>Login Someone</h1>
	</div>
	<form id="loginForm" class="form-horizontal" method="POST" action="login">
		<div class="form-group">
		<label class="col-xs-3 control-label">Username</label>
		<div class="col-xs-2">
		<input type="text" class="form-control" name="username" placeholder="Username" />
        </div>
        </div>
        
        <div class="form-group">
		<label class="col-xs-3 control-label">Password</label>
		<div class="col-xs-2">
		<input type="password" class="form-control" name="password" placeholder="Password" />
        </div>
        </div>
		<div class="form-group">
        <div class="col-xs-9 col-xs-offset-3">
            <button type="submit" class="btn btn-primary" name="signup" value="Sign up">Submit</button>
        </div>
    </div>
		
	</form>
	<div class="container top">
<%@ include file="footer.jsp" %>
</div>
</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/formValidation.min.js"></script>
	<script src="resources/js/framework/bootstrap.min.js"></script>
	<script src="resources/js/main.js"></script>
	<script src="<c:url value='/resources/js/login.js' />"></script>
</body>
</html>
