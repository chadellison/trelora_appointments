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
      url: 'http://localhost:3000/api/v1/users.json',
      dataType: "JSON",
      data: postParams,
      success: alert("user created"),
      error: function(errorBody){
        alert("error")
      }
    })
  })

  $("#f-w-submit").on('click', function(){
    var postParams = { post:
      { role: $("#f-w-role").val(),
      username: $("#f-w-username").val(),
      trelora_id: $("#f-w-trelora-id").val()
      }
    }

    $.ajax({
      type: 'POST',
      url: 'http://localhost:3000/api/v1/field_workers.json',
      dataType: "JSON",
      data: postParams,
      success: alert("field worker created"),
      error: function(errorBody){
        alert("error")
      }
    })
  })

});
