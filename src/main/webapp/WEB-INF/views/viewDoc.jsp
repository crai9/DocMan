<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>View Docs</title>
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
                <h1>Document Information</h1>
            </div>
            <h4><a class="btn btn-warning" href="<c:url value='/dashboard' />">Dashboard</a></h4>
            <h4><a class="btn btn-success" href="<c:url value='/createDocument' />">Create Document</a></h4>
            	<c:choose>
	<c:when test="${document.id != 0}">


		<div class="row" style="background-color:white; margin-top:50px; padding:20px;">
	  		<div class="col-md-4">
	  			<h3>Title: ${document.title}</h3>
	  			<h4><b>Description:</b> ${document.description}</h4>
	  			<p><b>Author:</b> ${document.author}</p>  	
	  		</div>
	  
  	   		<div class="col-md-4">	  
	  			<h3>Date Created: ${document.createdDate}</h3>
	  			<h4>Distribution Date: ${document.createdDate}</h4>
	  		</div>

  	  		<div class="col-md-4">
  	  			<table class="table table-bordered">
  	  				<tr>
  	  					<th>Revision Number</th>
  	  					<td>${document.revisionNo}</td>
  	  				</tr>
  	    	  		<tr>
  	  					<th>Document Attached/<br>Download</th>
  	  					<td><a href="/content/${document.documentAttached}">${document.documentAttached}</a></td>
  	  				</tr>
  	    	 
				  	<tr>
  	  					<th>Status</th>
  	  					<td>${document.status}</td>
  	  				</tr>

  	  			</table>
  	  	</div>
	</c:when>
	<c:otherwise>
	<div class="alert alert-danger" role="alert">
		Document with that id doesn't exist
	</div>
	</c:otherwise>
	</c:choose>
 
  	  
  	<!--<embed src="../resources/docs/eh.pdf" width="500" height="375">-->
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