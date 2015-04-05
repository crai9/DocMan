var querypath;
if (location.port == "8080") {
    querypath = '/DocMan/queryUsers?name=%QUERY';
} else {
    querypath = '/queryUsers?name=%QUERY';
}
$(document).ready(function(){
	
	var users = new Bloodhound({
		datumTokenizer: Bloodhound.tokenizers.obj.whitespace('username'),
		queryTokenizer: Bloodhound.tokenizers.whitespace,
		remote: querypath
	});
	
	users.initialize();
	
	$("#query").typeahead({
		hint: true,
		highlight: true,
		minLength: 1,
	}, {
		name: "users",
		displayKey: "username",
		source: users.ttAdapter(),
		templates: {
			suggestion: function(s){
				var suggestion = s.firstName + " " + s.lastName + " - <strong>" + s.username + "</strong>";
				return suggestion;
			}
			
		}
	});
	
});
//$('#search').formValidation({
//	framwork: 'bootstrap',
//	icon: {
//		valid: 'glyphican glyphican-ok',
//		invalid: 'glyphican glyphican-remove',
//		validating: 'glyphican glyphican-refresh',
//	}, 
//	fields: {
//		search: {
//			validators: {
//				notEmpty: {
//					message: 'Please enter something in the search box for results'
//				}
//			}
//		}
//	}
//});
