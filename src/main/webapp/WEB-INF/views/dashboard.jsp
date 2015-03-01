
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

  </head>

  <body>

	<%@ include file="menu.jsp" %>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="#">Blank</a></li>
            <li><a href="#">Blank</a></li>
            <li><a href="#">Blank</a></li>
            <li><a href="#">Blank</a></li>
            <li><a href="#">Blank</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="#">Blank</a></li>
            <li><a href="#">Blank</a></li>
            <li><a href="#">Blank</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Your Docs</h1>

          <h2 class="sub-header">Section title</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Name</th>
                  <th>Date</th>
                  <th>Author</th>
                  <th>Last column</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1,001</td>
                  <td>A File.pdf</td>
                  <td>Today</td>
                  <td>Someone</td>
                  <td></td>
                </tr>
                <tr>
                  <td>1,002</td>
                  <td>Another File.pdf</td>
                  <td>Today</td>
                  <td>Someone</td>
                  <td></td>
                </tr>
                <tr>
                  <td>1,003</td>
                  <td>Hello.pdf</td>
                  <td>Today</td>
                  <td>Someone</td>
                  <td></td>
                </tr>
                <tr>
                  <td>1,003</td>
                  <td>World.pdf</td>
                  <td>Today</td>
                  <td>Someone</td>
                  <td></td>
                </tr>
                <tr>
                  <td>1,004</td>
                  <td><a href="resources/docs/pdf-sample.pdf" target="_blank">pdf-sample.pdf (preview)</a></td>
                  <td>Today</td>
                  <td>Someone</td>
                  <td></td>
                </tr>
                <tr>
                  <td>1,005</td>
                  <td><a href="resources/docs/pdf-sample.pdf">pdf-sample.pdf (force download)</a></td>
                  <td>Today</td>
                  <td>Someone</td>
                  <td></td>
                </tr>
                <tr>
                  <td>1,006</td>
                  <td>Hello.pdf</td>
                  <td>Today</td>
                  <td>Someone</td>
                  <td></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>

  </body>
</html>
