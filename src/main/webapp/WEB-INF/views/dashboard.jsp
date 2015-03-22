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

                <h1>Test</h1>
                <h4><c:if test="${authenticated == false || empty authenticated}">not logged in</c:if></h4>
                <h4><c:if test="${authenticated == true || !empty authenticated}">Logged in</c:if></h4>
                <h4><c:if test="${admin == true}">admin</c:if></h4>
                <h4><c:if test="${user == true}">user</c:if></h4>
                <p>Nullam eleifend mauris eu elit viverra, at elementum lacus consectetur. Etiam quam sapien, egestas non sapien eget, semper accumsan sem. Maecenas rhoncus bibendum pulvinar. Maecenas convallis ac lectus a ultrices. Nulla gravida, eros vitae elementum dictum, felis quam vestibulum dui, in varius lorem magna feugiat magna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras placerat sapien vitae nunc tempor venenatis. Curabitur malesuada ex nec venenatis blandit. Nam at tortor justo. Maecenas nec odio ac metus porta vulputate non in erat. Donec eu mauris ultricies dui porttitor luctus facilisis at nunc. Sed ultrices ut ligula ullamcorper egestas. Nulla facilisi. Suspendisse ut congue lorem, id tincidunt libero. Donec sed felis sapien. In dignissim suscipit massa, in porta nisi. Mauris sollicitudin dapibus urna ut sodales. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In vulputate augue at faucibus egestas. Nullam lobortis auctor ligula, non lobortis tellus hendrerit ut. Morbi volutpat, mauris ultricies faucibus maximus, metus leo placerat ligula, quis euismod elit lorem eu tortor. Fusce tincidunt arcu arcu, molestie luctus nibh imperdiet quis. Praesent auctor varius elit at tristique. Nullam porta quam quis tortor vulputate egestas. Etiam vestibulum, nisi vel volutpat pharetra, odio ex sagittis tortor, ut egestas libero lectus eu ante. Duis venenatis aliquam varius. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent gravida sapien ac arcu elementum, eu sodales ex eleifend. Sed accumsan nunc id nibh sagittis tristique. Aliquam luctus pretium enim et volutpat. Phasellus suscipit maximus dui. Fusce elementum tristique molestie. Donec gravida dictum ante, eu feugiat nunc laoreet ut. Duis ullamcorper nulla justo, in suscipit diam eleifend in. Phasellus vitae mattis nulla, non aliquam nisl. Nulla sit amet sem odio. Duis finibus gravida metus, et convallis lacus lacinia et. Sed dignissim iaculis libero, vel pulvinar lacus viverra vel. Etiam sollicitudin faucibus nunc in vulputate. Vivamus pretium vestibulum quam quis volutpat. Integer urna quam, bibendum nec molestie in, dapibus sed tortor. Integer nibh ante, vehicula id vestibulum nec, facilisis in lacus.
                </p>

                <%@ include file="footer.jsp" %>

            </div>
		<%@ include file="sidemenu.jsp" %>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.mmenu.min.all.js"></script>
    <script src="resources/js/createDoc.js"></script>
    <script src="resources/js/main.js"></script>
</body>

</html>