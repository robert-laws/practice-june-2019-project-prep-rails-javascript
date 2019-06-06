$(document).ready(function () {
  $(".negative").on("click", function () {
    $("#answer").text("negative")
  })

  $(".positive").on("click", function () {
    $("#answer").text("positive")
  })
});



$(function () {
  $("#test").click(function () {
    $('#sample-modal')
      .modal({
        centered: false
      })
      .modal('show');
  });
});