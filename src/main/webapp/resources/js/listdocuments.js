$(document).ready(function() {
    $("#docSearch").submit(function() {
        var query = document.getElementById("query").value.replace('/','');
        if (query) {
        	if(location.port == "8080"){
        		window.location.href = '/DocMan/documents/search/' + query + "/page/1";
        	} else {
        		window.location.href = '/documents/search/' + query + "/page/1";
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