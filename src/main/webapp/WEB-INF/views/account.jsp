<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Account</title>
	<link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/css/formValidation.min.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/css/jquery.mmenu.all.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/css/global.css' />" rel="stylesheet">
</head>
<body>
	<%@ include file="menu.jsp" %>
	
	<div class="container top">
	<div class="page-header">
  		<h1>My Account</h1>
	</div>
	<a href="../../users/page/1" class="btn btn-default btn-xs" role="button">&laquo; Back to list</a><br><br>
	
	<form id="updateAccount" class="form-horizontal" method="POST" action="updateAccount">
	<div class="form-group">
	 <label class="col-xs-3 control-label">Full name</label>
        <div class="col-xs-2">
        	<input type="hidden" name="id" value="${user.id}">
            <input type="text" class="form-control" name="fname" value="${users.firstName}"/>
        </div>
        <div class="col-xs-3">
            <input type="text" class="form-control" name="lname" value="${users.lastName}" />
        </div>
    </div>
    
     <div class="form-group">
        <label class="col-xs-3 control-label">Email address</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" name="email" value="${users.email}" />
        </div>
    </div>
	
	    <div class="form-group">
        <label class="col-xs-3 control-label">Username</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" name="username" value="${users.username}"/>
        </div>
    </div>
    
     <div class="form-group">
        <label class="col-xs-3 control-label">Old Password</label>
        <div class="col-xs-5">
            <input type="password" class="form-control" name="password" />
        </div>
    </div>
    
     <div class="form-group">
        <label class="col-xs-3 control-label">New Password</label>
        <div class="col-xs-5">
            <input type="password" class="form-control" name="newpassword" />
        </div>
    </div>
    
     <div class="form-group">
        <label class="col-xs-3 control-label">Confirm New Password</label>
        <div class="col-xs-5">
            <input type="password" class="form-control" name="cnewpassword" />
        </div>
    </div>
    
	<div class="form-group">
        <div class="col-xs-9 col-xs-offset-3">
            <button type="submit" class="btn btn-primary" name="signup" value="Update User">Update User</button>
        </div>
    </div>
	</form>
	
	<div class="container top">
	<%@ include file="footer.jsp" %>
	<%@ include file="sidemenu.jsp" %>
	
	</div>
</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/resources/js/formValidation.min.js' />"></script>
	<script src="<c:url value='/resources/js/framework/bootstrap.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.mmenu.min.all.js' />"></script>
	<script src="<c:url value='/resources/js/main.js' />"></script>
</body>
</html>
