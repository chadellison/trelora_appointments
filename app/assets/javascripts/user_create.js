$(document).ready(function() {

  $('#add-user').on('click', function() {
    $('#user-menu').addClass("user-create-menu");
    $('#user-menu').removeClass("hidden");
    $('#map').removeClass("map-width-100");
    $('#map').addClass("map-width-75");
  });

  $("#user-submit").on('click', function(){
    var postParams = { post:
      { profile: $("#user-profile").val() }
    }

    $.ajax({
      type: 'POST',
      url: 'https://localhost/api/v1/users.json',
      dataType: "JSON",
      data: postParams,
      success: function(newPost) {
        alert("user created")
      },
      error: function(errorBody){
        alert("error")
      }
    })
  })

});
