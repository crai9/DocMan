$(document).ready(function() {
	$('#loginForm').formValidation({
		framework: 'bootstrap',
		icon: {
			valid: 'glyphican glyphican-ok',
			invalid: 'glyphican glyphican-remove',
			validating: 'glyphican glyphican-refresh',
		},
		fields: {
			username: {
				validators: {
					notEmpty: {
						message: 'The username is required'
					}
				}
			},
			password: {
				validators: {
					notEmpty: {
						message: 'The password is required'
					}
				}
			}
		}
	});
});