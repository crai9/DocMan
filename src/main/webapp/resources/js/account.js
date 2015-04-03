$(document).ready(function() {
	$('#editForm').formValidation({
		framwork: 'bootstrap', 
		fields: {
			fname: {
				validators: {
					notEmpty: {
						message: 'The first name is required'
					}
				}
			},
			lname: {
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
                    	 url: 'checkUser',
                      
                         data: function(validator) {
                             return {
                                 id: validator.getFieldElements('id').val()
                             };
                         },
                         message: 'The username is not available',
                         type: 'GET'
                    }
                }
            }, 
            password: {
                validators: {
                    notEmpty: {
                        message: 'The old password is required'
                    },
                    different: {
                        field: 'username',
                        message: 'The password cannot be the same as username'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The password must be more than 6 and less than 30 characters long'
                    }
                }
            },
            nPassword: {
                validators: {
                    notEmpty: {
                        message: 'The new password is required'
                    },
                    different: {
                        field: 'username',
                        message: 'The password cannot be the same as username'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The password must be more than 6 and less than 30 characters long'
                    }
                }
            },
            cPassword: {
                validators: {
                    notEmpty: {
                        message: 'The confirmed password is required'
                    },
                    different: {
                        field: 'username',
                        message: 'The confirmed password cannot be the same as username'
                    },
                    identical: {
                        field: 'nPassword',
                        message: 'The passwords must match'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The password must be more than 6 and less than 30 characters long'
                    }
                }
            },
		}
	});
	var success = getParameterByName("success");
	if(success == "no"){
		$("#error").removeClass("hidden");
		$("#error").addClass("show");
	} 
});