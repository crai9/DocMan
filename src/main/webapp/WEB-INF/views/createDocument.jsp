<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Create Document</title>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/css/global.css" rel="stylesheet">
</head>
<body>

<%@ include file="menu.jsp" %>

<div class="container top">
	<div class="page-header">
  		<h1>Create Document</h1>
	</div>
	
<div id="createDocument">
	<h2 class="text-center">Create Document</h2>
	<form method="POST" enctype="multipart/form-data" action="create">
		Document Name: <input type="text" class="form-control" name="title"><br/>
		Description: <textarea name="description" class="form-control" rows="5"></textarea></br>
		Author Name: <input type="text" class="form-control" name="authorName"><br/>
	<input type="button" name="next" id="nextCD" class="btn btn-success" value="Next">	
	
</div>

<div id="uploadDocument" class="hidden">
	<h2 class="text-center">Upload Document</h2>
		Revision Number: <input type="text" class="form-control" name="revNo"><br/>
		Document Attachment: <input type="file" class="form-control" name="docAttach"><br/>
		Date Created: <input type="text" class="form-control" name="dateCreated"><br/>
		Status: <input type="text" class="form-control" name="status"><br/>
	<input type="button" name="previous" id="previous" class="btn btn-success" value="Previous">
	<input type="button" name="next" id="nextUD" class="btn btn-success" value="Next">	
		
</div>

<div id="addDistributee" class="hidden">
	<h2 class="text-center">Add Distributee</h2>
		UserName: <input type="text" class="form-control" name="userName"><br/>
		DistributionDate: <input type="text" class="form-control" name="date"><br/>
	<input type="button" name="previous" id="previous2" class="btn btn-success" value="Previous">
	<input type="submit" name="submit" id="createDoc" class="btn btn-success" value="Create Document">	
	</form>	
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/formValidation.min.js"></script>
	<script src="resources/js/framework/bootstrap.min.js"></script>
	<script src="resources/js/main.js"></script>
	<script src="resources/js/createDoc.js"></script>
	<script src="<c:url value='../../resources/js/edit.js' />"></script>
</body>
</html>
