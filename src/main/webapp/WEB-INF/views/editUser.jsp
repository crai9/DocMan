<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Update Page</title>
	<link href="../../resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="../../resources/css/formValidation.min.css" rel="stylesheet">
	<link href="../../resources/css/global.css" rel="stylesheet">
</head>
<body>
	<%@ include file="menu.jsp" %>
	
	<div class="container top">
	<div class="page-header">
  		<h1>Edit a User</h1>
	</div>
	<a href="../../users/page/1" class="btn btn-default btn-xs" role="button">&laquo Back to list</a><br><br>
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
    <c:choose>
    <c:when test="${!admin}">
    <div class="form-group">
       <label class="col-xs-3 control-label">Admin</label>
       <div class="col-xs-3">
           <div class="radio">
               <label>
                   <input type="radio" name="adminRole" value="no" /> No
               </label>
           </div>
           <div class="radio">
               <label>
                   <input type="radio" name="adminRole" value="yes" checked="checked" /> Yes
               </label>
           </div>
       </div>
    </div>
    <div class="form-group hidden">
        <label class="col-xs-3 control-label">Original Admin</label>
        <div class="col-xs-3">
            <div class="radio">
                <label>
                    <input type="radio" name="originalAdminRole" value="no" disabled /> No
                </label>
            </div>
            <div class="radio">
                <label>
                    <input type="radio" name="originalAdminRole" value="yes" checked="checked" /> Yes
                </label>
            </div>
        </div>
    </div>
    </c:when>
    <c:otherwise>
    <div class="form-group">
       <label class="col-xs-3 control-label">Admin</label>
       <div class="col-xs-3">
           <div class="radio">
               <label>
                   <input type="radio" name="adminRole" value="no" checked="checked" /> No
               </label>
           </div>
           <div class="radio">
               <label>
                   <input type="radio" name="adminRole" value="yes" /> Yes
               </label>
           </div>
       </div>
    </div>
    <div class="form-group hidden">
        <label class="col-xs-3 control-label">Original Admin</label>
        <div class="col-xs-3">
            <div class="radio">
                <label>
                    <input type="radio" name="originalAdminRole" value="no" checked="checked" /> No
                </label>
            </div>
            <div class="radio">
                <label>
                    <input type="radio" name="originalAdminRole" value="yes" disabled/> Yes
                </label>
            </div>
        </div>
    </div>
    </c:otherwise>
    </c:choose>
    
	<div class="form-group">
        <div class="col-xs-9 col-xs-offset-3">
            <button type="submit" class="btn btn-primary" name="signup" value="Update User">Update User</button>
        </div>
    </div>
	
	
	

		<!--<input type="submit" name="submit" value="Update User">-->
	</form>
	</c:when>
	<c:otherwise>
	<div class="alert alert-danger" role="alert">
		User with that id doesn't exist
	</div>
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
