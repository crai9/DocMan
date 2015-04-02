<html lang="en">
<head>
<style>
.tt-dropdown-menu {
	width: calc(100% - 2px);
	border: 1px solid #bbb;
	border-top: 0;
	padding: 0;
}

.tt-input{
	padding: 5px 10px;
	border: 1px solid #bbb;
}

.tt-suggestion {
	padding: 5px 10px;
	margin: 0;
	cursor: pointer;
}

tt-suggestion p {
	margin: 5px 0;
}

tt-suggestion.tt-cursor {
	background-color: #ddd;
}

.tt-hint {
	color: #bbb;
}
</style>
</head>
<body>
    <div id="messages">
		<form action="users" method="get" autocomplete="off">
			<input type="text" name="user" id="users">
			<input type="submit" value="go">
		</form>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="resources/js/typeahead.js"></script>
    <script src="resources/js/global.js"></script>
</body>
</html>