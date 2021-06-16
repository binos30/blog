$(function() {
  if ($("#comment_body").val() == "") $("#create_comment_btn").attr("disabled", true);

  $("#comment_body").on("keyup", function() {
    if ($("#comment_body").val() != "")
      $("#create_comment_btn").attr("disabled", false);
    else $("#create_comment_btn").attr("disabled", true);
  });
});