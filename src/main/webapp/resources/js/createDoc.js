$(document).ready(function() {
    $("#nextCD").click(function() {
    	$("#uploadDocument").removeClass('hidden');
    	$("#createDocument").addClass('hidden');
    });
    $("#nextUD").click(function() {
    	$("#addDistributee").removeClass('hidden');
    	$("#uploadDocument").addClass('hidden');
    });
    $("#previous").click(function() {
    	$("#uploadDocument").addClass('hidden');
    	$("#createDocument").removeClass('hidden');
    });
    $("#previous2").click(function() {
    	$("#addDistributee").addClass('hidden');
    	$("#uploadDocument").removeClass('hidden');
    });
});

$('#link1').click(function () {
    window.location = '/DocMan/registerPage';
});

$('#link2').click(function () {
    window.location = '/DocMan/users/page/1';
});

$('#link3').click(function () {
    window.location = '/DocMan/createDocument';
});

$('#link4').click(function () {
    window.location = '/DocMan/documents';
});

