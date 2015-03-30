function confirmDelete(id) {
    swal({
            title: "Sure?",
            text: "Are you sure you want to delete this user?!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: '#DD6B55',
            confirmButtonText: 'Delete!',
            cancelButtonText: "Cancel!",
            closeOnConfirm: false,
            allowOutsideClick: true,
            closeOnCancel: false
        },
        function(response) {
            if (response == true) {
                $("#" + id).fadeOut(800, function() {
                    $("#" + id).remove();
                    return false;
                });
                swal({
                    title: "Deleted!",
                    text: "User was removed from database!",
                    type: "success",
                    timer: 1000,
                    showConfirmButton: false
                });
                setTimeout(function() {
                    if (location.port == "8080") {
                        url = "/DocMan/user/delete/" + id;
                    } else {
                        url = "/user/delete/" + id;
                    }
                    $.get(url);
                }, 1000);


            } else {
                swal({
                    title: "Canceled!",
                    text: "Request cancelled",
                    type: "success",
                    timer: 1000,
                    showConfirmButton: false
                });
            }
        });
    return false;
}

function confirmDeleteDocument(id) {
    swal({
            title: "Sure?",
            text: "Are you sure you want to delete this document?!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: '#DD6B55',
            confirmButtonText: 'Delete!',
            cancelButtonText: "Cancel!",
            closeOnConfirm: false,
            allowOutsideClick: true,
            closeOnCancel: false
        },
        function(response) {
            if (response == true) {
                $("#" + id).fadeOut(800, function() {
                    $("#" + id).remove();
                    return false;
                });
                swal({
                    title: "Deleted!",
                    text: "Document has been removed!",
                    type: "success",
                    timer: 1000,
                    showConfirmButton: false
                });
                setTimeout(function() {

                    if (location.port == "8080") {
                        url = "/DocMan/document/delete/" + id;
                    } else {
                        url = "/document/delete/" + id;
                    }
                    $.get(url);
                }, 1000);


            } else {
                swal({
                    title: "Canceled!",
                    text: "Request cancelled",
                    type: "success",
                    timer: 1000,
                    showConfirmButton: false
                });
            }
        });
    return false;
}

$(function() {
    $('nav#menu').mmenu({
        setSelected: false
    });
});

$(document).ready(function() {
    $("#search").submit(function() {
        var query = document.getElementById("query").value.replace('/', '');
        if (query) {
            if (location.port == "8080") {
                window.location.href = '/DocMan/users/search/' + query + "/page/1";
            } else {
                window.location.href = '/users/search/' + query + "/page/1";
            }

            //don't actually submit
            return false;
        } else {
            // alert("You can't search for nothing!");
            //same again
            return false;
        }
    });
    if (userId) {
        waitForMsg(); /* Start the inital request */
    }
});

var theCount = 999;
var sound = document.getElementById("sound");
var docUrl;
if (location.port == "8080") {
    docUrl = '/DocMan/viewDoc/';
} else {
    docUrl = '/viewDoc/';
}
var mark;
if (location.port == "8080") {
    mark = '/DocMan/markAsRead';
} else {
    mark = '/markAsRead';
}
var title = document.title;
function addmsg(type, count, notifications) {
    var htmlString = "";
    var noNotifications = "<li>You have no notifications.</li>";
    for (var i = 0; i < notifications.length; i++) {
        htmlString = htmlString + "<li><a id='" + notifications[i].notificationId + "' class='markAsRead' href='" + docUrl + notifications[i].documentId + "'> " + notifications[i].from + " shared " + notifications[i].documentTitle + " with you.</a></li>";
    }
    $("#count").html(count);
    if (count < 1) {
        $("#count").hide();
    } else {
        $("#count").show();
    }
    if (count > theCount) {
        sound.play();
    }
    theCount = count;
    if(count > 0){
    	$("#notifications").html(htmlString);
    	document.title = "(" + count + ") " + title;
    } else {
    	$("#notifications").html(noNotifications);
    	document.title = title;
    }
    
    $('.markAsRead').click(function (e) {
        e.preventDefault();                   // prevent default anchor behavior
        var goTo = this.getAttribute("href"); // store anchor href
        var docId = this.getAttribute("id");
        console.log("marking id: " + docId);
        $.ajax({
        	type: "GET",
        	url: mark,
        	data: {id: docId},
            success: function(data) {
                	window.location = goTo;  
            }
        	
        })
       
    });


}

function waitForMsg() {
    var url;
    if (location.port == "8080") {
        url = '/DocMan/getNotifications';
    } else {
        url = '/getNotifications';
    }

    $.ajax({
        type: "GET",
        url: url,
        data: {
            id: userId
        },
        timeout: 5000,

        success: function(data) {
            var count = data.count;
            addmsg("new", count, data.notifications);
            setTimeout(
                waitForMsg,
                3000
            );
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            addmsg("error", textStatus + " (" + errorThrown + ")");
            setTimeout(
                waitForMsg,
                5000);
        }
    });
};

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}