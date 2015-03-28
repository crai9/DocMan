$(document).ready(function() {
	$('#createForm').formValidation({
		framework: 'bootstrap', 
		icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	title: {
        		row: '.col-xs-2',
        		validators: {
        			notEmpty: {
        				message: 'Title Required'
        			}
        		}
        	},
        	description: {
        		row: '.col-xs-2',
        		validators: {
        			notEmpty: {
        				message: 'Description Required'
        			}
        		}
        	},
        	file: {
        		row: 'col-xs-2',
        		validators: {
        			notEmpty: {
        				message: "File required"
        			}
        		}
        	},
        	dateCreated: {
        		row: '.col-xs-2',
        		validators: {
        			notEmpty: {
        				message: 'Date Created Required'
        			}
        		}
        	},
        	
        }
	});
});