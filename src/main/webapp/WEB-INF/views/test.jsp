<html>
<head>
    <title>Notification Test</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js" type="text/javascript" charset="utf-8"></script>

    <style type="text/css" media="screen">
      body{ background:#000;color:#fff;font-size:.9em; }
      .msg{ background:#aaa;padding:.2em; border-bottom:1px #000 solid}
      .old{ background-color:#246499;}
      .new{ background-color:#3B9957;}
    .error{ background-color:#992E36;}
    </style>

    <script type="text/javascript" charset="utf-8">
    function addmsg(type, count, msg){
        /* Simple helper to add a div.
        type is the name of a CSS class (old/new/error).
        msg is the contents of the div */
        $("#messages").append(
            "<div class='msg "+ type +"'>"+ count + msg +"</div>"
        );
    }
	
    var userId = 204;
    
    function waitForMsg(){

        $.ajax({
            type: "GET",
            url: "getNotifications",
            data: {id: userId},
            timeout:5000,

            success: function(data){ 
                data = JSON.parse(data);
            	var count = data.count;
                addmsg("new", count, data);
                console.log(data.notifications);
                setTimeout(
                    waitForMsg, 
                    3000 
                );
            },
            error: function(XMLHttpRequest, textStatus, errorThrown){
                addmsg("error", textStatus + " (" + errorThrown + ")");
                setTimeout(
                    waitForMsg,
                    5000);
            }
        });
    };

    $(document).ready(function(){
        waitForMsg(); /* Start the inital request */
    });
    
    
    </script>
</head>
<body>
    <div id="messages">
        <div class="msg old">
            notifications
        </div>
    </div>
</body>
</html>