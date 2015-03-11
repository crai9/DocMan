<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
	<title>Update Page</title>
	<link href="../../resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="../../resources/css/formValidation.min.css" rel="stylesheet">
	<link href="../../resources/css/global.css" rel="stylesheet">
</head>
<body>
	<%@ include file="menu.jsp" %>
	
	<div class="container top">
	<div class="page-header">
	<a href="../../listAll" class="btn btn-default btn-xs" role="button">&laquo Back to list</a><br><br>
  		<h1>Edit Someone</h1>
	</div>
	
	<c:choose>
	<c:when test="${user.id != 0}">
	<form id="editForm" class="form-horizontal" method="GET" action="../../edit">
	<div class="form-group">
	 <label class="col-xs-3 control-label">Full name</label>
        <div class="col-xs-2">
        	<input type="hidden" name="id" value="${user.id}">
            <input type="text" class="form-control" name="fname" value="${user.firstName}"/>
        </div>
        <div class="col-xs-3">
            <input type="text" class="form-control" name="lname" value="${user.lastName}" />
        </div>
    </div>
    
     <div class="form-group">
        <label class="col-xs-3 control-label">Email address</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" name="email" value="${user.email}" />
        </div>
    </div>
	
	    <div class="form-group">
        <label class="col-xs-3 control-label">Username</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" name="username" value="${user.username}"/>
        </div>
    </div>
	
	<div class="form-group">
        <div class="col-xs-9 col-xs-offset-3">
            <button type="submit" class="btn btn-primary" name="signup" value="Update User">Update User</button>
        </div>
    </div>
	
	
	

		<!--<input type="submit" name="submit" value="Update User">-->
	</form>
	</c:when>
	<c:otherwise>
	<h4 style="color: red;'">Not valid user id</h4>
	</c:otherwise>
	</c:choose>
	
	<div class="container top">
	<%@ include file="footer.jsp" %>
	</div>
</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../../resources/js/bootstrap.min.js"></script>
	<script src="../../resources/js/formValidation.min.js"></script>
	<script src="../../resources/js/framework/bootstrap.min.js"></script>
	<script src="../../resources/js/main.js"></script>
	<script src="<c:url value='../../resources/js/edit.js' />"></script>
</body>
</html>
