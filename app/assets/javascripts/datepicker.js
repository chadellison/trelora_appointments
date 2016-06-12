$(document).ready(function() {
  $(function() {
    $( "#datepicker" ).datepicker();
  });

  $('#datepicker').datepicker({
    onSelect: function(dateText, inst) {
        console.log("hello")
    }
  });
})
