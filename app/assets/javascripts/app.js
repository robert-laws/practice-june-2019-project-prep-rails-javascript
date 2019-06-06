$(document).ready(function () {
  $(".negative").on("click", function () {
    $("#answer").text("negative")
  })

  $(".positive").on("click", function () {
    $("#answer").text("positive")
  })

  $.get("/authors.json", function (data) {
    console.log(data);
    data.forEach(function (item) {
      $("#author-data").append(item.name + "<br>");
    })
  });
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