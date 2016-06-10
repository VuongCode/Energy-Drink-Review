// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function() {
  $(".upvote").on("click", function(event) {
    event.preventDefault();
    var reviewID = $(this).attr("id");

    var request = $.ajax({
      method: "POST",
      url: "/reviews/" + reviewID + "/votes",
      data: { upvote: 1 },
      dataType: "json",
    });

    request.done(function(data) {
        $(".score-tracker" + reviewID).text(data);
    });

    return false;
  });

  $(".downvote").on("click", function(event) {
    event.preventDefault();
    var reviewID = $(this).attr("id");

    var request = $.ajax({
      method: "POST",
      url: "/reviews/" + reviewID + "/votes",
      data: { upvote: -1 },
      dataType: "json",
    });

    request.done(function(data) {
        $(".score-tracker" + reviewID).text(data);
    });

    return false;
  });
});
