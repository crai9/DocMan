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
