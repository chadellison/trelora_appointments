$(document).ready(function() {

  $('#remove-user').on('click', function() {
    $('#remove-user-menu').addClass("remove-user-menu");
    $('#remove-user-menu').removeClass("hidden");
    $('#user-menu').addClass("hidden");
    $('#map').removeClass("map-width-100");
    $('#map').addClass("map-width-75");
  });

  $('#exit').on('click', function() {
    $('#remove-user-menu').removeClass("remove-user-menu");
    $('#remove-user-menu').addClass("hidden");
    $('#map').removeClass("map-width-75");
    $('#map').addClass("map-width-100");
  });

  $("#remove-user-menu").delegate("delete").on('click', function(){
    var id = event.target.id
    $("#" + id).closest("div.employee").fadeOut()
  })
})
