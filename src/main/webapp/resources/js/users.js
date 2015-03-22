$('#search').formValidation({
	framwork: 'bootstrap',
	icon: {
		valid: 'glyphican glyphican-ok',
		invalid: 'glyphican glyphican-remove',
		validating: 'glyphican glyphican-refresh',
	}, 
	fields: {
		search: {
			validators: {
				notEmpty: {
					message: 'Please enter something in the search box for results'
				}
			}
		}
	}
});