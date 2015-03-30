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
