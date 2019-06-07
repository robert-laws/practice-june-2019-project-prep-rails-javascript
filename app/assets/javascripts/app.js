$(document).ready(function () {
  // $(".negative").on("click", function () {
  //   $("#answer").text("negative")
  // })

  // $(".positive").on("click", function () {
  //   $("#answer").text("positive")
  // })

  let authorsData = [];

  if ($("#books-show").length) {
    getBooksIndex();

    getAuthorList();

    $("#getBobCobbBooks").on("click", function (event) {
      event.preventDefault();
      filterBooks()
    })
  }

  if ($("#list-authors-page").length) {
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
  }
});


$(".new-author-form").submit(function (event) {
  //prevent form from submitting the default way
  event.preventDefault();
  var values = $(this).serialize();
  addAuthor(values);
});

function getBooks(id) {
  $.get(`/authors/${id}/books.json`, function (data) {
    console.log(data)
    $(`#author-books-${id}`).empty();
    if (data.length > 0) {
      $.each(data, function (index, value) {
        $(`#author-books-${id}`).append($("<p>", {
          class: "book-item"
        }).text(value.title));
      })
    } else {
      $(`#author-books-${id}`).append($("<p>", {
        class: "book-item"
      }).text("No Books Listed"));
    }
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

function getNext() {
  var nextId = parseInt($(".js-next").attr("data-id")) + 1;
  $.get("/books/" + nextId + ".json", function (data) {
    var book = data;
    $("#bookTitle").text(book["title"]);
    $("#bookDate").text(book["pub_date"]);
    $("#bookAuthor").text(`Author: ${book["author"]["name"]}`);

    $("#bookSubjects").text("");
    subjects = book["subjects"];
    subject_count = subjects.length;
    for (var i = 0; i < subject_count; i++) {
      $("#bookSubjects").append("<li>" + subjects[i]["name"] + "</li>")
    }

    // $(".productInventory").text(product["inventory"]);
    // // re-set the id to current on the link
    $(".js-next").attr("data-id", book["id"]);
  });
}

function filterBooks(authorName) {
  $(".card").css("display", "block")
  $(".card-author").each(function (index, value) {
    if (value.innerText != `Author: ${authorName}`) {
      $(".card").eq(index).css("display", "none");
    } else {

    }

  });
}

function getBooksIndex() {
  $("#books-list").empty();
  $.get("/books.json", function (data) {
    $.each(data, function (index, value) {
      let book = new Book(value);
      let html = book.basicHTML();
      $("#books-list").append(html);
    })
  })
}

function getAuthorList() {
  let selectControl = "<select id='select-author' class='form-control mb-2'><option value='0'>Choose an Author</option>";
  $.get("/authors.json", function (data) {
    $.each(data, function (index, value) {
      let author = value.name;
      let optionItem = `<option value="${author}">${author}</option>`;
      selectControl += optionItem;
    });
    selectControl += "</select>";
    $("#author-select").append(selectControl);

    $("#select-author").on("change", function () {
      filterBooks(this.value);
    })
  });
}

class Book {
  constructor(obj) {
    this.id = obj.id;
    this.title = obj.title;
    this.pub_date = obj.pub_date;
    this.author = obj.author.name
  }
}

Book.prototype.basicHTML = function () {
  return (`
    <div class="card my-4">
      <div class="card-body">
        <h5 class="card-title">${this.title}</h5>
        <p class="card-text card-author">Author: ${this.author}</p>
        <p class="card-text card-pub-date">Publish Date: ${this.pub_date}</p>
      </div>
    </div>
  `)
}