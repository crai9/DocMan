<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login Page</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/formValidation.min.css" rel="stylesheet">
    <link href="resources/css/global.css" rel="stylesheet">
    <link href="resources/css/signin.css" rel="stylesheet">
    <link href="resources/css/jquery.mmenu.all.css" rel="stylesheet">
</head>

<body>

    <%@ include file="menu.jsp" %>
        <div class="container top">

            <form id="loginForm" class="form-signin" method="POST" action="login">
                <div class="page-header">
                    <h2 class="form-signin-heading">Log into Document Manager</h2>
                </div>
                <div id="error" class="alert alert-danger hidden" role="alert">
                    Incorrect login details, try again
                </div>
                <div class="form-group">
                    <label for="inputEmail" class="sr-only">Email address</label>
                    <input type="text" name="username" id="inputEmail" class="form-control" placeholder="Username">
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="sr-only">Password</label>
                    <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password">
                </div>
                <div class="form-group">
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                </div>
            </form>

            <div class="container top">
                <%@ include file="footer.jsp" %>
            </div>
            <%@ include file="sidemenu.jsp" %>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/formValidation.min.js"></script>
        <script src="resources/js/framework/bootstrap.min.js"></script>
        <script src="resources/js/jquery.mmenu.min.all.js"></script>
        <script src="resources/js/main.js"></script>
        <script src="<c:url value='/resources/js/login.js' />"></script>
</body>

</html>