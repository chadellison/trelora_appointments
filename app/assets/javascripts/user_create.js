$(document).ready(function() {

  $('#add-user').on('click', function() {
    $('#user-menu').addClass("user-create-menu");
    $('#user-menu').removeClass("hidden");
    $('#remove-user-menu').removeClass("remove-user-menu")
    $('#remove-user-menu').addClass("hidden");
    $('#map').removeClass("map-width-100");
    $('#map').addClass("map-width-75");
  });

  function closeMenu() {
    $('#user-menu').removeClass("user-create-menu");
    $('#user-menu').addClass("hidden");
    $('#map').removeClass("map-width-75");
    $('#map').addClass("map-width-100");
  }

  $('#exit-user-menu').on('click', function() {
    closeMenu()
  });

  $("#user-submit").on('click', function(){
    var postParams = { user:
      { username: $("#user-username").val(),
        password: $("#user-password").val(),
        role: $("#user-role").val()
      }
    }

    $.ajax({
      type: 'POST',
      url: '/api/v1/users.json',
      dataType: "JSON",
      data: postParams,
      success: function(data){
        $(".new-trelorians").append("Created new user!")
        closeMenu()
      },

      error: function(errorBody){
        alert("error")
      }
    })
  })

  $("#f-w-submit").on('click', function(){
    var postParams = { field_worker:
      { role: $('input[name=role]:checked').val(),
      username: $("#f-w-username").val(),
      trelora_id: $("#f-w-trelora-id").val()
      }
    }
    $.ajax({
      type: 'POST',
      url: '/api/v1/field_workers.json',
      dataType: "JSON",
      data: postParams,
      success: function(data){
        $(".new-trelorians").append("Created new field worker!")
        closeMenu()
      },
      error: function(errorBody){
        alert("error")
      }
    })
  })
});
