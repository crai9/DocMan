$(document).ready(function() {
    	$('#create').formValidation({
	        framework: 'bootstrap',
	        err: {
	            container: '#messages'
	        },
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
	            title: {
	                	validators: {
	                		notEmpty: {
	                			message: 'Document Name is required!'
	                		}
	                	}
	            	},
	           description: {
	        	   validators: {
	        		   notEmpty: {
	        			   message: 'Document Description is required!'
	        		   }
	        	   }
	           }, 
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
	           }	
	        }
    	});

    });
