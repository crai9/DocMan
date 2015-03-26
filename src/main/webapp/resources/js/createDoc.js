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