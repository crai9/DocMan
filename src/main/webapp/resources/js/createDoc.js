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


