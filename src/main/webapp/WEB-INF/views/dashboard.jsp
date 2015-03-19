
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

    <!-- Custom styles for this template -->
    <link href="resources/css/dashboard.css" rel="stylesheet">
    
    <link href="http://cdnjs.cloudflare.com/ajax/libs/normalize/3.0.1/normalize.css" rel="stylesheet" type="text/css">
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

  </head>

  <body>

	<%@ include file="menu.jsp" %>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
           <c:if test="${admin == true}"> <li><a href="<c:url value='/users/page/1' />">Administrator</a></li></c:if>
            <li><a href="<c:url value='/createDocument' />">Document Management System</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">




<section class="strips">
<c:if test="${admin == true}">
  <article class="strips__strip">
    <div class="strip__content">
      <h1 class="strip__title" data-name="Lorem"><a href="/DocMan/registerPage">Register User</a></h1>
      <div class="strip__inner-text">
		
      </div>
      
    </div>
  </article>
</c:if>
<c:if test="${admin == true}">
  <article class="strips__strip">
    <div class="strip__content">
      <h1 class="strip__title" data-name="Ipsum"><a href="users/page/1">View Users</a></h1>
      <div class="strip__inner-text">
       
      </div>
    </div>
  </article>
</c:if>
  <article class="strips__strip">
    <div class="strip__content">
      <h1 class="strip__title" data-name="Dolor"><a href="/DocMan/createDocument">Create Document</a></h1>
      <div class="strip__inner-text">
       
      </div>
    </div>
  </article>


  <article class="strips__strip">
    <div class="strip__content">
      <h1 class="strip__title" data-name="Dolor"><a href="documents">View Documents</a></h1>
      <div class="strip__inner-text">
      
      </div>
    </div>
  </article>


  <i class="fa fa-close strip__close"></i>
</section>
        </div>
      </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/createDoc.js"></script>

  </body>
</html>
