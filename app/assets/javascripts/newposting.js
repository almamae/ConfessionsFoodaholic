$(function(){
	$("#newpic").click(function(){
		$("#formnew").show();
		$(".post-file").show();
		$(".post-text").show();		
		$(".post-vid").hide();
	});

	$("#newvid").click(function(){
 		$("#formnew").show();
	 	$(".post-text").show();
	 	$(".post-vid").show();
	 	$(".post-file").hide();
	 });	

	$("#newblog").click(function(){
 		$("#formnew").show();
	 	$(".post-text").show();
	 	$(".post-file").hide();
	 	$(".post-vid").hide();
	 });	
	
});
