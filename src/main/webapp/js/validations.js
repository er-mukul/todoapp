$(document).ready(function(){
 $('#commentForm').validate(
 {highlight: function(label) {
    $(label).closest('.control-group').addClass('error');
  },
  success: function(label) {
	  $(label).closest('.control-group').addClass('success');
  }
 });
}); // end document.ready