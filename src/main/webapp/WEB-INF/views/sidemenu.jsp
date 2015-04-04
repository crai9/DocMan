<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav id="menu">
    <ul>
        <li><a href="<c:url value='/home'/>">Home</a></li>
        <c:if test="${authenticated == false || empty authenticated}"><li><a href="<c:url value='/loginPage'/>">Log in</a></li></c:if>
        <c:if test="${admin == true}">
        <li><a href="<c:url value='/users/page/1'/>">View Users</a></li>
        <li><a href="<c:url value='/registerPage'/>">Add a User</a></li>
        </c:if>
        <c:if test="${u == true}">
        <li><a href="<c:url value='/documents/page/1'/>">View Documents</a></li>
        <li><a href="<c:url value='/documents/own'/>">Your Documents</a></li>
        <li><a href="<c:url value='/createDocument'/>">Create Documents</a></li>
        <li><a href="<c:url value='/dashboard'/>">Dashboard</a></li>
        <li><a href="<c:url value='/logout'/>">Log Out</a></li>
        </c:if>       
    </ul>
</nav>