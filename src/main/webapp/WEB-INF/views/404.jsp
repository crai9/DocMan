<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>404</title>
	<link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/css/formValidation.min.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/css/global.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/css/jquery.mmenu.all.css' />" rel="stylesheet">
</head>
<body>
<%@ include file="menu.jsp" %>
<div class="container top">
<div class="page-header">
<h1>Error 404</h1>
</div>
<a href="<c:url value='/home' />" class="btn btn-primary btn-sm" role="button">&laquo; Go home</a><br><br>
<div class="alert alert-danger" role="alert">
	This page doesn't exist
</div>

<%@ include file="footer.jsp" %>
</div>
<%@ include file="sidemenu.jsp" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
    <script src="<c:url value='/resources/js/formValidation.min.js' />"></script>
    <script src="<c:url value='/resources/js/framework/bootstrap.min.js' />"></script>
    <script src="<c:url value='/resources/js/jquery.mmenu.min.all.js' />"></script>
    <script src="<c:url value='/resources/js/main.js' />"></script>
</body>
</html>