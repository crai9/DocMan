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
	<link href="resources/css/formValidation.min.css" rel="stylesheet">
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
	
	<form action="create" enctype="multipart/form-data" id="create" method="POST" class="form-horizontal">	
		
		<div id="createDocument">
			<h2 class="text-center">Create Document</h2>

				<div class="form-group">
					<label class="col-xs-3 control-label">Document Name</label>
					<div class="col-xs-6">
						<input type="text" class="form-control" name="title"  id="title" placeholder="Document Name"/>
					</div>
				</div>
				
				<div class="form-group">
				<label class="col-xs-3 control-label">Description</label>
				<div class="col-xs-6">
					<textarea name="description" id="description" class="form-control" rows="5"></textarea>
				</div>
				</div>
				
				<div class="form-group">
				<label class="col-xs-3 control-label">Author Name</label>
				<div class="col-xs-6">
					<input type="text" class="form-control" value="${you.username}" name="authorName" readonly/>
				</div>
				</div>
	
				<div class="form-group">
					<div class="col-xs-9 col-xs-offset-3">
						<button type="button" class="btn btn-success" name="next" id="nextCD">Next</button>
					</div>
			</div>	
		</div>
		
		<div id="uploadDocument" class="hidden">
			<h2 class="text-center">Upload Document</h2>
				
				<div class="form-group">
					<label class="col-xs-3 control-label">Revision number</label>
					<div class="col-xs-6">
						<input value="1" type="number" min="1" class="form-control" name="revNo" readonly/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-xs-3 control-label">Document Attachment</label>
					<div class="col-xs-6">
						<input type="text" class="form-control" name="file" id="file"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-xs-3 control-label">Date Created</label>
					<div class="col-xs-3 input-group date" id="datetimepicker">
						<input type="text" class="form-control" name="dateCreated" id="dateCreated"/>
						<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-xs-3 control-label">Status</label>
					<div class="col-xs-6">
						<select class="form-control" name="status">
							<option>Active</option>
							<option>Inactive</option>
							<option>Outdated</option>
						</select>
					</div>
				</div>
				

				
				<div class="form-group">
					<div class="col-xs-9 col-xs-offset-3">
						<button type="button" name="previous" id="previous" class="btn btn-success">Previous</button>
						<button type="button" name="next" id="nextUD" class="btn btn-success">Next</button>
					</div>
				</div>
</div>				
				
	<div id="addDistributee" class="hidden">
		<h2 class="text-center">Add Distributee</h2>
		
		<div class="form-group">
			<label class="col-xs-3 control-label">Username:</label>
			<div class="col-xs-6">
				<input id="addUser" type="text" class="form-control" name="userName">
				<button id="push" onclick="return false;" class="btn btn-success">Add</button>
				<ol id="listUsers">
				</ol>
				<input value="[]" class="hidden" id="distributees" type="text" class="form-control" name="distributees" readonly><br/>
			</div>
		</div>
		
	<!-- #messages is where the messages are placed inside -->
    	<div class="form-group">
        	<div class="col-xs-9 col-xs-offset-3">
            	<div class="bg-danger">
            		<ol id="messages">
            		</ol>
            	</div>
        	</div>
    	</div>
		
		<div class="form-group">
			<div class="col-xs-9 col-xs-offset-3">
				<button type="button" name="previous" id="previous2" class="btn btn-success">Previous</button>
				<button type="submit" id="submitBtn" class="btn btn-primary" name="go" value="Sign up">Create Document</button>
			</div>
		</div>
		</div>
</form>

<div class="container top">
<%@ include file="footer.jsp" %>
<%@ include file="sidemenu.jsp" %>
</div>
</div>
	
	<script src="resources/js/moment.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="resources/js/bootstrap-datetimepicker.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/formValidation.min.js"></script>
	<script src="resources/js/framework/bootstrap.min.js"></script>
	<script src="<c:url value='/resources/js/jquery.mmenu.min.all.js' />"></script>
	<script src="resources/js/mandatoryIcon.js"></script>
	<script src="resources/js/main.js"></script>
	<script src="resources/js/documentValidation.js"></script>
	<script src="resources/js/createDoc.js"></script>
	
	
</body>
</html>
