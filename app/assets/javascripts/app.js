$(document).ready(function () {
  // $(".negative").on("click", function () {
  //   $("#answer").text("negative")
  // })

  // $(".positive").on("click", function () {
  //   $("#answer").text("positive")
  // })

  $(".new-author-form").submit(function (event) {
    //prevent form from submitting the default way
    event.preventDefault();
    var values = $(this).serialize();
    addAuthor(values);
  });

  $.get("/authors.json", function (data) {
    console.log(data);
    data.forEach(function (item) {
      $("#authorsList").append($("<p>", {
        id: `author-${item.id}`
      }).text(item.name))
      $(`#author-${item.id}`).append($("<button>", {
        id: `author-button-${item.id}`,
        class: 'btn btn-secondary mx-4',
        data: `${item.id}`
      }).text(`show books for ${item.name}`).attr("data-id", item.id).click(function (event) {
        event.preventDefault();
        getBooks(item.id)
      }));
      $("#authorsList").append($("<div>", {
        id: `author-books-${item.id}`
      }));
    })
  });
});

function getBooks(id) {
  $.get(`/authors/${id}/books.json`, function (data) {
    console.log(data)
    $(`#author-books-${id}`).empty();
    $.each(data, function (index, value) {
      $(`#author-books-${id}`).append($("<p>", {
        class: "book-item"
      }).text(value.title));
    })
  })
}

function addAuthor(values) {
  var newAuthor = $.post('/authors', values);
  newAuthor.done(function (data) {
    $("#authorName").text(data["name"]);
    $("#authorAge").text(data["age"]);
    $("#authorLocation").text(data["location"]);
  });
}