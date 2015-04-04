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
$(document).on('change', '.btn-file :file', function() {
	  var input = $(this),
	      numFiles = input.get(0).files ? input.get(0).files.length : 1,
	      label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
	  input.trigger('fileselect', [numFiles, label]);
	});

$(document).ready( function() {
  $('.btn-file :file').on('fileselect', function(event, numFiles, label) {
      
      var input = $(this).parents('.input-group').find(':text'),
          log = numFiles > 1 ? numFiles + ' files selected' : label;
      
      if( input.length ) {
          input.val(log);
      } else {
          if( log ) alert(log);
      }
      
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
                $('#listUsers').append("<li class='bg-success'>" + user.capitalize() + '</li>');
            } else if (!user) {
               alert("empty");
            } else {
            	alert("not a valid user");
            }

        });
});