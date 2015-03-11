<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<html>
<head>
	<title>Create Document Page</title>
</head>
<body>
	<a href="listAll">Back to list</a>
	<form method="POST" action="create">
		Document Name: <input type="text" name="documentName"><br/>
		Revision Number: <input type="text" name="revisionNumber"><br/>
		Author Name: <input type="text" name="authorName"><br/>
		Distributee:<input type="text" name="distributee">
		<br/>
		Date Created: <input type="text" name="date"><br/>
		Status: <input type="text" name="status"><br/>
		Upload Document <input type="file" name="upload"><br/>
		<input type="submit" name="submit" value="Create Document">
		
	</form>
</body>
</html>
