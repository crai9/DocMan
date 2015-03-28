<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Create Document</title>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/css/global.css" rel="stylesheet">
	<link href="<c:url value='/resources/css/jquery.mmenu.all.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/css/bootstrap-datetimepicker.min.css' />" rel="stylesheet">
</head>
<body>

<%@ include file="menu.jsp" %>

	<div class="container top">
	<div class="page-header">
  		<h1>Create Document</h1>
	</div>
	<a href="dashboard" class="btn btn-warning" role="button">Dashboard</a><br><br>
	<a href="documents/page/1" class="btn btn-primary" role="button">View Documents</a><br><br>
	
	<form method="POST" enctype="multipart/form-data" action="create" id="createForm">
		<div id="createDocument">
			<h2 class="text-center">Create Document</h2>

				Document Name: <input type="text" class="form-control" name="title"><br>
				Description: <textarea name="description" class="form-control" rows="5"></textarea><br>
				Author Name: <input value="${you.username}" type="text" class="form-control" name="authorName" readonly><br>
				<input type="button" name="next" id="nextCD" class="btn btn-success" value="Next &raquo;">	
		</div>

		<div id="uploadDocument" class="hidden">
			<h2 class="text-center">Upload Document</h2>
				Revision Number: <input value="1" type="number" min="1" class="form-control" name="revNo" readonly><br/>
				Document Attachment: <input type="text" class="form-control" name="file"><br>
				Date Created:
			<div class="form-group">
				<div class='input-group date' id='datetimepicker'>
					<input type='text' class="form-control" name="dateCreated" />
					<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
				</div>
			</div>
			Status:
					<select class="form-control" name="status">
		  			<option>Active</option>
		  			<option>Inactive</option>
		  			<option>Outdated</option>
					</select>
			<br>
	
			<input type="button" name="previous" id="previous" class="btn btn-success" value="&laquo; Previous">
			<input type="button" name="next" id="nextUD" class="btn btn-success" value="Next &raquo;">	
		
	</div>

		<div id="addDistributee" class="hidden">
			<h2 class="text-center">Add Distributee</h2>
				UserName: <input id="addUser" type="text" class="form-control" name="userName">
				<button id="push" onclick="return false;" class="btn btn-success" >Add</button><br><br>
				<ol id="listUsers">
				</ol>
			<br>
				<input value="[]" class="hidden" id="distributees" type="text" class="form-control" name="distributees" readonly><br/>
				<input type="button" name="previous" id="previous2" class="btn btn-success" value="&laquo; Previous">
				<button type="submit" class="btn btn-primary" name="submit" value="Sign up">Create Document</button>	
	
</div>
</form>	
<div class="container top">
<%@ include file="footer.jsp" %>
<%@ include file="sidemenu.jsp" %>
</div>
</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="<c:url value='/resources/js/moment.min.js' />"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/formValidation.min.js"></script>
	<script src="resources/js/framework/bootstrap.min.js"></script>	
	<script src="<c:url value='/resources/js/bootstrap-datetimepicker.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.mmenu.min.all.js' />"></script>
	<script src="resources/js/main.js"></script>
	<script src="resources/js/createDoc.js"></script>
	<script src="resources/js/documentValidation.js"></script>
</body>
</html>
