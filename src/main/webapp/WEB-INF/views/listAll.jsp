<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>

<head>
    <title>List of users</title>
    <link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">
    <link href="<c:url value='/resources/css/formValidation.min.css' />" rel="stylesheet">
    <link href="<c:url value='/resources/css/global.css' />" rel="stylesheet">
</head>

<body>
    <%@ include file="menu.jsp" %>
        <div class="container top">
            <div class="page-header">
                <h1>User List</h1>
            </div>
            <h4><a class="btn btn-success" href="<c:url value='/registerPage' />">Add new</a></h4>
            <c:choose>
                <c:when test="${!empty list}">
                    <form id="search">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-4">
                                    <input id="query" type="text" name="search" class="form-control" placeholder="Search for users..." />
                                </div>
                                <button type="submit" class="btn btn-primary">Search</button>
                            </div>
                        </div>
                    </form>
                    <br>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover table-bordered">
                            <tr>
                                <th>UserId</th>
                                <th>Username</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            <c:forEach items="${list}" var="user">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.username}</td>
                                    <td>${user.firstName}</td>
                                    <td>${user.lastName}</td>
                                    <td>${user.email}</td>
                                    <td><a href="<c:url value='/user/edit/${user.id}' />" class="btn btn-primary btn-sm">Edit</a></td>
                                    <td><a href="#" class="btn btn-danger btn-sm" onclick="confirmDelete(${user.id})">Delete</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="../../listAll" class="btn btn-info btn-sm" role="button">&laquo Go back</a>
                    <br>
                    <br>
                    <div class="alert alert-danger" role="alert">
                        No results!
                    </div>

                </c:otherwise>
            </c:choose>
            <%@ include file="footer.jsp" %>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
        <script src="<c:url value='/resources/js/formValidation.min.js' />"></script>
        <script src="<c:url value='/resources/js/framework/bootstrap.min.js' />"></script>
        <script src="<c:url value='/resources/js/main.js' />"></script>
</body>

</html>