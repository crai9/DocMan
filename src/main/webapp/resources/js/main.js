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
      
        swal({
        	title:"Deleted!", 
        	text:"User was removed from database!",
        	type:"success",
        	timer:1000,
        	showConfirmButton: false
        });	
        setTimeout(function(){
        	window.location.href = "/DocMan/user/delete/" + id;
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
}



$(document).ready(function() {
    $("#search").submit(function() {
        var query = document.getElementById("query").value;
        if (query) {
            window.location.href = '/DocMan/listAll/search/' + query;
            //don't actually submit
            return false;
        } else {
           // alert("You can't search for nothing!");
            //same again
            return false;
        }
    });
});

$('#search').formValidation({
	framwork: 'bootstrap',
	icon: {
		valid: 'glyphican glyphican-ok',
		invalid: 'glyphican glyphican-remove',
		validating: 'glyphican glyphican-refresh',
	}, 
	fields: {
		search: {
			validators: {
				notEmpty: {
					message: 'Please enter something in the search box for results'
				}
			}
		}
	}
});
		
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}


