<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<html>
<body>
	<table>
		<tr>
			<td>First Name</td>
			<td>Last Name</td>
			<td>Email</td>
			<td>Username</td>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td><a href="<c:url value='/edit/${person.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/remove/${person.id}' />" >Delete</a></td>
		</tr>
	</table>
</body>
</html>
