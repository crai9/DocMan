function confirmDelete(id) {
    var x = confirm("Are you sure you want to delete that user?");
    if (x == true) {
        window.location.href = "/DocMan/user/delete/" + id;
    }
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

    })
})