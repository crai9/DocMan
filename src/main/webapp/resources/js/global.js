$(document).ready(function(){
	
	var users = new Bloodhound({
		datumTokenizer: Bloodhound.tokenizers.obj.whitespace('username'),
		queryTokenizer: Bloodhound.tokenizers.whitespace,
		remote: "queryUsers?name=%QUERY"
	});
	
	users.initialize();
	
	$("#users").typeahead({
		hint: true,
		highlight: true,
		minLength: 1,
	}, {
		name: "users",
		displayKey: "username",
		source: users.ttAdapter()
	});
	
});