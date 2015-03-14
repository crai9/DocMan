<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>List of users</title>
	<link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/css/formValidation.min.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/css/global.css' />" rel="stylesheet">
</head>
<body>
<%@ include file="menu.jsp" %>
<div class="container top">
<div class="page-header">
<h1>Error 403</h1>
</div>
<a href="<c:url value='/home' />" class="btn btn-info btn-sm" role="button">&laquo Go home</a><br><br>
<div class="alert alert-danger" role="alert">
	Sorry, you don't have access to this page
</div>

<%@ include file="footer.jsp" %>
</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
    <script src="<c:url value='/resources/js/formValidation.min.js' />"></script>
    <script src="<c:url value='/resources/js/framework/bootstrap.min.js' />"></script>
    <script src="<c:url value='/resources/js/main.js' />"></script>
</body>
</html>