<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<body>
<h3>Persons List</h3>
<h4><a href="registerPage">Add new</a></h4>
<c:choose>
<c:when test="${!empty list}">
	<table border="1" class="tg">
	<tr>
		<th width="80">UserId</th>
		<th width="120">Username</th>
		<th width="120">First Name</th>
		<th width="120">Last Name</th>
		<th width="120">Email</th>
		
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${list}" var="user">
		<tr>
			<td>${user.id}</td>
			<td>${user.username}</td>
			<td>${user.firstName}</td>
			<td>${user.lastName}</td>
			<td>${user.email}</td>
		
			<td><a href="<c:url value='user/edit/${user.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/user/delete/${user.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:when>
<c:otherwise>
<h4 style="color: red;">No results!</h4>
</c:otherwise>
</c:choose>
</body>
</html>