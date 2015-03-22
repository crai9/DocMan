<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav id="menu">
    <ul>
        <li><a href="<c:url value='/home'/>">Home</a></li>
        <c:if test="${authenticated == false || empty authenticated}"><li><a href="<c:url value='/loginPage'/>">Log in</a></li></c:if>
        <li><a href="#about">Stuff</a>
            <ul>
                <li><a href="#about/history">Create Doc</a></li>
                <li><a href="#about/team">View Docs</a></li>
                <li><a href="#about/address">Delete Docs</a></li>
            </ul>
        </li>
        <li><a href="#contact">Admin</a></li>
        <li></li>
    </ul>
</nav>