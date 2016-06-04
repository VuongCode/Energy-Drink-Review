// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  $("div.votes.a").click(function(event) {
    event.preventDefault();
    debugger;
    var commentForm = newCommentForm("form#new_comment");
    var commentCreator = newCommentCreator(commentForm.attributes(), "div#comments");
    commentCreator.create();
  });
});
