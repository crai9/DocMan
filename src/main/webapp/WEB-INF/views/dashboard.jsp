<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Document Manager</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/jquery.mmenu.all.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="resources/css/global.css" rel="stylesheet">
    <!--  <link href="resources/css/dashboard.css" rel="stylesheet"> -->
</head>

<body>
    <%@ include file="menu.jsp" %>
        <div class="container top">
            <div class="page-header">
                <h1>Dashboard</h1>
            </div>
            <h3>Quick Links</h3>
            <div class="well well-lg centered-nav">
	                <a href="createDocument" class="btn btn-lg btn-success">New Document</a>
	                <a href="documents/page/1" class="btn btn-lg btn-info">All Documents</a>
	                <a href="documents/own" class="btn btn-lg btn-warning">Your Documents</a>
	                <a href="account" class="btn btn-lg btn-danger">Your Account</a>
	                <c:if test="${admin == true}">
				        <a class="btn btn-primary btn-lg" href="<c:url value='/users/page/1'/>">Users List</a>
				        <a class="btn btn-primary btn-lg" href="<c:url value='/registerPage'/>">New User</a>
        			</c:if>
                
            </div>
            <div class="panel panel-default">

                <div class="panel-heading">
                    <h4>Documents shared with you</h4></div>
                <div class="panel-body">
                    <p>The most recent documents that have been shared with you, click here to <a href="documents/page/1" class="btn btn-primary btn-xs">See more</a> documents.</p>
                </div>

                <!-- Table -->
                <c:choose>
                <c:when test="${!empty documents}">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Author</th>
                                <th>Created</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${documents}" var="document">
                                <tr id="${document.id}">
                                <th scope="row">${document.title}</th>
                                <td>${document.author}</td>
                                <td>${document.createdDate}</td>
                                <td>
                                    <a href="<c:url value='/viewDoc/${document.id}'/>" class="btn btn-xs btn-info">View</a>
                                    <a href="/content/${document.documentAttached}" class="btn btn-xs btn-warning">Download</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                </c:when>
                <c:otherwise>
                                
                <div class="panel-body">
                    <p>No documents have been shared with you</p>
                </div>
                </c:otherwise>
                </c:choose>

            </div>

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h4>Your documents</h4></div>
                <div class="panel-body">
                    <p>The most recent documents you've created. <a href="documents/own" class="btn btn-primary btn-xs">More</a>
                        <br>Create another document? <a href="createDocument" class="btn btn-success btn-xs">Create</a></p>
                </div>
				<c:choose>
                <c:when test="${!empty owndocuments}">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Revision</th>
                                <th>Created</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${owndocuments}" var="document">
                            <tr id="${document.id}">
                                <th scope="row">${document.title}</th>
                                <td>${document.revisionNo}</td>
                                <td>${document.createdDate}</td>
                                <td>
                                    <a href="<c:url value='/viewDoc/${document.id}'/>" class="btn btn-xs btn-info">View</a>
                                    <a href="<c:url value='/reviseDocument/${document.id}'/>" class="btn btn-primary btn-xs">Revise</a>
                                    <a href="/content/${document.documentAttached}" class="btn btn-xs btn-warning">Download</a>
                                    <a onclick="confirmDeleteDocument(${document.id})" class="btn btn-xs btn-danger">Delete</a>
                                </td>
                            </tr>                        
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
                </c:when>
                <c:otherwise>
                <div class="panel-body">
                    <p>You haven't made any documents yet.</p>
                </div>
                </c:otherwise>
                </c:choose>
                <!-- Table -->
            </div>

            <%@ include file="footer.jsp" %>

        </div>
        <%@ include file="sidemenu.jsp" %>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
            <script src="resources/js/bootstrap.min.js"></script>
            <script src="resources/js/jquery.mmenu.min.all.js"></script>
            <script src="resources/js/main.js"></script>
</body>

</html>