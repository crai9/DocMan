<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Documents</title>
    <link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">
    <link href="<c:url value='/resources/css/formValidation.min.css' />" rel="stylesheet">
    <link href="<c:url value='/resources/css/global.css' />" rel="stylesheet">
    <link href="<c:url value='/resources/css/jquery.mmenu.all.css' />" rel="stylesheet">
    <link href="<c:url value='/resources/css/sweet-alert.css' />" rel="stylesheet">
</head>

<body>

    <%@ include file="menu.jsp" %>
        <div class="container top">
            <div class="page-header">
                <h1>Document List</h1>
            </div>
            <h4><a class="btn btn-warning" href="<c:url value='/dashboard' />">Dashboard</a></h4>
            <h4><a class="btn btn-success" href="<c:url value='/createDocument' />">Create Document</a></h4>

            <div class="table-responsive">
                <table class="table table-striped table-hover table-bordered">
                    <tr>
						<th>Document Name</th>
						<th>Document Author</th>
						<th>Date Created</th>
						<th>Status</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach items="${document}" var="document">
                    <tr id="${document.id}">
                        <td>${document.title}</td>
                        <td>${document.author}</td>
                        <td>${document.createdDate}</td>
                        <td>${document.status}</td>
                        

                        <td><a href="" class="btn btn-primary btn-sm">Edit</a>
                            <a onclick="confirmDeleteDocument(${document.id})" class="btn btn-sm btn-danger">Delete</a>
                            <a href="" class="btn btn-sm btn-warning">Download</a>
                            <a href='viewDoc/${document.id}' class="btn btn-sm btn-info">View Doc</a>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
            <%@ include file="sidemenu.jsp" %>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
        <script src="<c:url value='/resources/js/formValidation.min.js' />"></script>
        <script src="<c:url value='/resources/js/framework/bootstrap.min.js' />"></script>
        <script src="<c:url value='/resources/js/jquery.mmenu.min.all.js' />"></script>

        <script src="<c:url value='/resources/js/main.js' />"></script>
        <script src="<c:url value='/resources/js/sweet-alert.min.js' />"></script>
</body>

</html>