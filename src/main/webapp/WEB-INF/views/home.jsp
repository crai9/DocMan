<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Document Manager Home</title>
	<link rel="shortcut icon" href="/DocMan/resources/img/icon.png">
	<link href="resources/css/jquery.mmenu.all.css" rel="stylesheet">
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/css/global.css" rel="stylesheet">
    <link href="resources/css/carousel.css" rel="stylesheet">
  </head>

  <body>

	<%@ include file="menu.jsp" %>

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img src="resources/img/grey.gif" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Sign up now</h1>
              <p>Manager your documents more efficiently</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="resources/img/grey.gif" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Full of features</h1>
              <p>Such as upload, login [write more]</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="resources/img/grey.gif" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Document Manager</h1>
              <p>The world's best document manger</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">See preview</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>

    <div class="container marketing">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It'll blow your mind.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive" src="http://www.gabankruptcylawyersnetwork.com/files/2014/01/documents_pile.jpg" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-5">
          <img class="featurette-image img-responsive" src="http://www.cambridgebusinesslounge.com/wp-content/uploads/2013/09/document-management.jpg" alt="Generic placeholder image">
        </div>
        <div class="col-md-7">
          <h2 class="featurette-heading">Oh yeah, it's that good. <span class="text-muted">See for yourself.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">And lastly, this one.</h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive" src="https://www.baroan.com/images/stories/Solutions/document%20mgt%20man%20stacing%20red%20binder%20in%20row.jpg" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">
		
		<%@ include file="footer.jsp" %>
		
    </div>
	<%@ include file="sidemenu.jsp" %>
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.mmenu.min.all.js"></script>
    <script src="resources/js/main.js"></script>
    
    
  </body>
</html>
