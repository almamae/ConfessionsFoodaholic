$(function(){
	$(" #post .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
});