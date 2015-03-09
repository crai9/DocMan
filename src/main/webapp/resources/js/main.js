function confirmDelete(id){
	var x = confirm("Are you sure you want to delete that user?");
	if(x == true){
		window.location.href= "user/delete/" + id;
	}
}

function validatePassword() {
    var pass1 = document.getElementById("p1").value;
    var pass2 = document.getElementById("p2").value;
    var username = document.getElementById("username").value;
    
    var ok = true;
    if ((pass1 != pass2)) {
        //alert("Passwords Do not match");
        document.getElementById("p1").style.borderColor = "#FF0000";
        document.getElementById("p2").style.borderColor = "#FF0000";
        document.getElementById("message").innerHTML = "Passwords don't match";
        ok = false;
        
    }
    else {
        document.getElementById("message").innerHTML = "All Good";
        document.getElementById("message").style.color = "#33CC33";
        setTimeout(1000);
        
    }
    return ok;
}