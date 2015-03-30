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
    function(response){
    if (response == true) {
    	$("#"+id).fadeOut(800, function(){
    		$("#"+id).remove();
            return false;
        });
        swal({
        	title:"Deleted!", 
        	text:"User was removed from database!",
        	type:"success",
        	timer:1000,
        	showConfirmButton: false
        });	
        setTimeout(function(){
        	if(location.port == "8080"){
        		url = "/DocMan/user/delete/" + id;
        	} else {
        		url = "/user/delete/" + id;
        	}
        	$.get( url );
        }, 1000);
        
        
    }else {
    	 swal({
         	title:"Canceled!", 
         	text:"Request cancelled",
         	type:"success",
         	timer:1000,
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
    function(response){
    if (response == true) {
    	$("#"+id).fadeOut(800, function(){
    		$("#"+id).remove();
            return false;
        });
        swal({
        	title:"Deleted!", 
        	text:"Document has been removed!",
        	type:"success",
        	timer:1000,
        	showConfirmButton: false
        });	
        setTimeout(function(){
        	
        	if(location.port == "8080"){
        		url = "/DocMan/document/delete/" + id;
        	} else {
        		url = "/document/delete/" + id;
        	}
        	$.get( url );
        }, 1000);
        
        
    }else {
    	 swal({
         	title:"Canceled!", 
         	text:"Request cancelled",
         	type:"success",
         	timer:1000,
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
        var query = document.getElementById("query").value.replace('/','');
        if (query) {
        	if(location.port == "8080"){
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
});

		
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

