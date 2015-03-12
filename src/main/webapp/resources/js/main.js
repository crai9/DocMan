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
		closeOnCancel: false
    },
    function(response){
    if (response == true) {
      
       
    	window.location.href = "/DocMan/user/delete/" + id;

        swal({
        	title:"Deleted!", 
        	text:"It was deleted!",
        	type:"error",
        	timer:1000
        });	
    }else {
    	 swal({
         	title:"Canceled!", 
         	text:"It was not deleted!",
         	type:"success",
         	timer:2000
         });
    }
    });
}



$(document).ready(function() {
    $("#search").submit(function() {
        var query = document.getElementById("query").value;
        if (query) {
            window.location.href = '/DocMan/listAll/search/' + query;
            //don't actually submit
            return false;
        } else {
            alert("You can't search for nothing!");
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


