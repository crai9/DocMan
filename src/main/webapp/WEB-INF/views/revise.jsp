<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Revise Document</title>
	<link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/css/formValidation.min.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/css/global.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/css/jquery.mmenu.all.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/css/bootstrap-datetimepicker.min.css' />" rel="stylesheet">
</head>
<body>

<%@ include file="menu.jsp" %>

	<div class="container top">
	<div class="page-header">
  		<h1>Revise Document</h1>
	</div>
	<a href="../dashboard" class="btn btn-warning" role="button">Dashboard</a><br><br>
	<a href="../documents/page/1" class="btn btn-primary" role="button">View Documents</a><br><br>
	
	<form enctype="multipart/form-data" action="../revise" method="POST" class="form-horizontal" id="revise">	
				
				<div class="form-group">
					<input type="hidden" name="documentId" value="${revision.id}"/>
					<label class="col-xs-3 control-label">Revision number</label>
					<div class="col-xs-8">
						<input type="number" min="1" class="form-control" name="revNo" value="${revisionNo}" readonly/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-xs-3 control-label">Document Attachment</label>
					<div class="col-xs-8">
						<input type="file" class=" " name="file" id="file" value="${revision.documentAttached}"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-xs-3 control-label">Date Created</label>
					<div class="col-xs-8 input-group date" style="padding-left: 15px; width: 62.333333%;" id="datetimepicker">
						<input type="text" class="form-control" name="dateCreated" id="dateCreated" value="${revision.createdDate}"/>
						<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-xs-3 control-label">Status</label>
					<div class="col-xs-8">
						<select class="form-control" name="status">
							<option<c:if test="${revision.status == 'Active'}"> selected </c:if>>Active</option>
							
							<option<c:if test="${revision.status == 'Inactive'}"> selected </c:if>>Inactive</option>
							
							<option<c:if test="${revision.status == 'Outdated'}"> selected </c:if>>Outdated</option>
						</select>
					</div>
				</div>
		
				<div class="form-group">
					<div class="col-xs-9 col-xs-offset-3">
						<button type="submit" class="btn btn-primary" name="go">Revise Document</button>
					</div>
				</div>
</form>

<div class="container top">
<%@ include file="footer.jsp" %>
<%@ include file="sidemenu.jsp" %>
</div>
</div>
	
	<script src="<c:url value='/resources/js/moment.min.js'/>"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="<c:url value='/resources/js/bootstrap-datetimepicker.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/resources/js/formValidation.min.js'/>"></script>
	<script src="<c:url value='/resources/js/framework/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.mmenu.min.all.js' />"></script>
	<script src="<c:url value='/resources/js/main.js'/>"></script>
	<script src="<c:url value='/resources/js/reviseDocument.js'/>"></script>
	
	
</body>
</html>
