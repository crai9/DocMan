$(document).ready(function() {
	
    $("#nextCD").click(function() {
    	$("#uploadDocument").removeClass('hidden');
        $("#createDocument").addClass('hidden');
    });
    
    $("#nextUD").click(function() {
        $("#addDistributee").removeClass('hidden');
        $("#uploadDocument").addClass('hidden');
    });
    $("#previous").click(function() {
        $("#uploadDocument").addClass('hidden');
        $("#createDocument").removeClass('hidden');
    });
    $("#previous2").click(function() {
        $("#addDistributee").addClass('hidden');
        $("#uploadDocument").removeClass('hidden');
    });
    $('#datetimepicker').datetimepicker({
        format: 'YYYY-MM-DD'
    });  
    
});

$(document).ready(function(){
	
	var users = new Bloodhound({
		datumTokenizer: Bloodhound.tokenizers.obj.whitespace('username'),
		queryTokenizer: Bloodhound.tokenizers.whitespace,
		remote: "queryUsers?name=%QUERY"
	});
	
	users.initialize();
	
	$("#addUser").typeahead({
		hint: true,
		highlight: true,
		minLength: 1,
	}, {
		name: "users",
		displayKey: "username",
		source: users.ttAdapter()
	});
	
});

var distributees = new Array();

$("#push").click(function() {
    var user = $("#addUser").val();
    //check if real user
    $.get("validUser", {
            username: user
        })
        .done(function(data) {
        	console.log(data);
            if (data.valid && user) {

                distributees.push(data.id);
                //reset input box
                $("#addUser").val("");
                //fill submitted input
                var json = JSON.stringify(distributees);
                $("#distributees").val(json);
                //add to ol
                $('#listUsers').append('<li>' + user + '</li>');
            } else if (!user) {
               alert("empty");
            } else {
            	alert("not a valid user");
            }

        });
});