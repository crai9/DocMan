$(document).ready(function() {
	
    $('#datetimepicker').datetimepicker({
        format: 'YYYY-MM-DD'
    });  
    	$('#revise').formValidation({
	        framework: 'bootstrap',
	        icon: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	       
	        addOns: {
	            mandatoryIcon: {
	                icon: 'glyphicon glyphicon-asterisk'
	            }
	        },
	        fields: {
	           file: {
	        	   validators: {
	        		   notEmpty: {
	        			   message: 'You need to upload a file!'
	        		   },
	        		   file: {
	        			   type: 'image/png,image/jpeg,image/gif,text/plain,application/pdf,application/vnd.ms-powerpoint,application/kswps,' 
	        				   + 'video/mp4,video/mpeg,application/msword,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.presentationml.presentation,'
	        				   + 'application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
	        			   message: 'That file is not valid'
	        		   }
	        	   }
	           },
	           dateCreated: {
	        	   validators: {
	        		   notEmpty: {
	        			   message: 'Date is requried! Example: 2015-03-21'
	        		   }, 
	        		   date: {
	        			   format: 'YYYY-MM-DD',
	        			   message: 'Example: 2015-03-21'
	        		   }
	        	   }
	           },
	           status: {
	        	   validators: {
	        		   notEmpty: {
	        			   message: 'Status required!'
	        		   }
	        	   }
	           }
	        }
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