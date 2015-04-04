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
                <h1><c:if test="${yourdocs == true}">Your </c:if>Document List</h1>
            </div>
            <h4><a class="btn btn-warning" href="<c:url value='/dashboard' />">Dashboard</a></h4>
            <h4><a class="btn btn-success" href="<c:url value='/createDocument' />">Create Document</a></h4>
			<c:choose>
                <c:when test="${!empty documents}">
                <c:if test="${yourdocs != true}">
	                <form id="docSearch">
	                  <div class="form-group">
	                      <div class="row">
	                          <div class="col-xs-6">
	                              <input id="query" type="text" name="search" class="form-control" placeholder="Search for documents..." />
	                          </div>
	                          <button type="submit" class="btn btn-primary">Search</button>
	                          <c:choose>
	                              <c:when test="${!empty search}">
	                                  <a href="<c:url value='/documents/page/1' />" class="btn btn-primary">&laquo; Go Back</a>
	                              </c:when>
	                          </c:choose>
	                      </div>
	                  </div>
	              </form>
	              </c:if>
	              <br>
                <div class="table-responsive">
	                <table class="table table-striped table-hover table-bordered">
	                    <tr>
							<th>Document Name</th>
							<th>Document Author</th>
							<th>Date Created</th>
							<th>Status</th>
	                        <th>Action</th>
	                    </tr>
	                    <c:forEach items="${documents}" var="document">
	                    <tr id="${document.id}">
	                        <td>${document.title}</td>
	                        <td>${document.author}</td>
	                        <td>${document.createdDate}</td>
	                        <td>${document.status}</td>
	                        
	
	                        <td>
	                        <c:if test="${yourdocs == true}">
	                        	<a href="<c:url value='/reviseDocument/${document.id}'/>" class="btn btn-primary btn-sm">Revise</a>
	                            <a onclick="confirmDeleteDocument(${document.id})" class="btn btn-sm btn-danger">Delete</a>
	                        </c:if> 
	                            <a href="/content/${document.documentAttached}" class="btn btn-sm btn-warning">Download</a>
	                            <a href="<c:url value='/viewDoc/${document.id}' />" class="btn btn-sm btn-info">View Doc</a>
	                        </td>
	                    </tr>
	                    </c:forEach>
	                </table>
	            </div>
                <c:if test="${nextPage != 0 && totalPages > 1}">
                    <div class="container">
                        <nav class="centered-nav">
                            <ul class="pagination">
                                <li>
                                    <a <c:if test="${pageNo > 1 && !empty totalPages}">href="${prevPage}"</c:if> aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                	<li class='<c:if test="${pageNo == loop.index}">active</c:if>'><a href="${loop.index}">${loop.index}</a></li>
                                </c:forEach>
                                <li>
                                    <a <c:if test="${pageNo < totalPages && !empty totalPages}">href="${nextPage}"</c:if> aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </c:if>
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/documents/page/1' />" class="btn btn-primary" role="button">&laquo; Go back</a>
                    <br>
                    <br>
                    <div class="alert alert-danger btn-sm" role="alert">
                        No results!
                    </div>
                </c:otherwise>
                </c:choose>

            <%@ include file="sidemenu.jsp" %>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
        <script src="<c:url value='/resources/js/formValidation.min.js' />"></script>
        <script src="<c:url value='/resources/js/framework/bootstrap.min.js' />"></script>
        <script src="<c:url value='/resources/js/jquery.mmenu.min.all.js' />"></script>
		<script src="<c:url value='/resources/js/listdocuments.js' />"></script>
        <script src="<c:url value='/resources/js/main.js' />"></script>
        <script src="<c:url value='/resources/js/sweet-alert.min.js' />"></script>
</body>

</html>