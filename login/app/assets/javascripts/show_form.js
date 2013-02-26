$(document).ready(function() {
  $('reply-form').hide();

   $('reply-button').click(function() {
       $(this).show($('reply-form'))
   });
});