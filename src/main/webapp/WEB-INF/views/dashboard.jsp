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
            	<div class="btn-group" role="group">
	                <a href="createDocument" class="btn btn-lg btn-success">New Document</a>
	                <a href="documents" class="btn btn-lg btn-info">All Documents</a>
	                <a href="documents/own" class="btn btn-lg btn-warning">Your Documents</a>
	                <a href="account" class="btn btn-lg btn-danger">Your Account</a>
	                <c:if test="${admin == true}">
				        <a class="btn btn-primary btn-lg" href="<c:url value='/users/page/1'/>">Users List</a>
				        <a class="btn btn-primary btn-lg" href="<c:url value='/registerPage'/>">New User</span></a>
        			</c:if>
                </div>
            </div>
            <div class="panel panel-default">

                <div class="panel-heading">
                    <h4>Documents shared with you</h4></div>
                <div class="panel-body">
                    <p>The most recent documents that have been shared with you, click here to <a href="documents" class="btn btn-primary btn-xs">See more</a> documents.</p>
                </div>

                <!-- Table -->
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
                            <tr>
                                <th scope="row">Sample</th>
                                <td>Not Craig</td>
                                <td>2/11/14</td>
                                <td>
                                    <a href="" class="btn btn-xs btn-info">View</a>
                                    <a href="" class="btn btn-xs btn-warning">Download</a>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Secret Document</th>
                                <td>Someone</td>
                                <td>1/3/2015</td>
                                <td>
                                    <a href="" class="btn btn-xs btn-info">View</a>
                                    <a href="" class="btn btn-xs btn-warning">Download</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h4>Your documents</h4></div>
                <div class="panel-body">
                    <p>The most recent documents you've created. <a href="documents/own" class="btn btn-primary btn-xs">More</a>
                        <br>Create another document? <a href="createDocument" class="btn btn-success btn-xs">Create</a></p>
                </div>

                <!-- Table -->
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Views</th>
                                <th>Created</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">Sample</th>
                                <td>43</td>
                                <td>2/11/14</td>
                                <td>
                                    <a href="" class="btn btn-xs btn-info">View</a>
                                    <a href="" class="btn btn-primary btn-xs">Revise</a>
                                    <a href="" class="btn btn-xs btn-warning">Download</a>
                                    <a href="" class="btn btn-xs btn-danger">Delete</a>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Secret Document</th>
                                <td>72</td>
                                <td>1/3/2015</td>
                                <td>
                                    <a href="" class="btn btn-xs btn-info">View</a>
                                    <a href="" class="btn btn-primary btn-xs">Revise</a>
                                    <a href="" class="btn btn-xs btn-warning">Download</a>
                                    <a href="" class="btn btn-xs btn-danger">Delete</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
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