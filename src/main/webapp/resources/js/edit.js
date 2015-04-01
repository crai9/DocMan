$(document).ready(function() {
	$('#editForm').formValidation({
		framwork: 'bootstrap',
		icon: {
			valid: 'glyphican glyphican-ok',
			invalid: 'glyphican glyphican-remove',
			validating: 'glyphican glyphican-refresh',
		}, 
		fields: {
			fname: {
				row: '.col-xs-4',
				validators: {
					notEmpty: {
						message: 'The first name is required'
					}
				}
			},
			lname: {
				row: '.col-xs-4',
				validators: {
					notEmpty: {
						message: 'The last name is required'
					}
				}
			},
			email: {
				validators: {
					notEmpty: {
						message: 'The email address is required'
					},
					emailAddress: {
						message: 'The input is not a valid email address'
					}
				}
			},
			username: {
                validators: {
                    notEmpty: {
                        message: 'The username is required'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The username must be more than 6 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'The username can only consist of alphabetical, number, dot and underscore'
                    },
                    remote: {
                    	 url: '../../checkUser/',
                         // Send { username: 'its value', email: 'its value' } to the back-end
                         data: function(validator) {
                             return {
                                 id: validator.getFieldElements('id').val()
                             };
                         },
                         message: 'The username is not available',
                         type: 'GET'
                    }
                }
            }
		}
	});
});