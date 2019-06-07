BookSubject.delete_all
Subject.delete_all
Book.delete_all
Author.delete_all

a1 = Author.create(name: "Bob Cobb", age: 34, location: "Chicago")
a2 = Author.create(name: "Hal Hope", age: 39, location: "New York")
a3 = Author.create(name: "Jim Jupe", age: 52, location: "Boston")

subjects = [
  {name: "art"},
  {name: "history"},
  {name: "travel"},
  {name: "cooking"},
  {name: "fishing"},
  {name: "sports"}
]

subjects.each do |subject|
  Subject.create(subject)
end

books = [
  {title: "Book of Fun", pub_date: 2012, author: a1},
  {title: "New Things Happened", pub_date: 1985, author: a1},
  {title: "Golf Time in the Rain", pub_date: 1999, author: a2},
  {title: "Reading with Cookies", pub_date: 2011, author: a1},
  {title: "Train to Town", pub_date: 1995, author: a3},
  {title: "Water on the Flowerpot", pub_date: 2001, author: a1},
  {title: "Racing for Daylight", pub_date: 2004, author: a2},
  {title: "Knights of the Dinner Roll", pub_date: 1998, author: a2},
  {title: "Keeping in One Spot", pub_date: 2017, author: a3},
  {title: "Cat Cousins", pub_date: 2011, author: a1},
  {title: "Imagining Some New Stars", pub_date: 2012, author: a1},
  {title: "Purple Liver", pub_date: 2008, author: a2},
  {title: "Under the Bridge to the Garage", pub_date: 2002, author: a1},
  {title: "Yellow Vines for Blue Flowers", pub_date: 1992, author: a3},
  {title: "Need to Run Home", pub_date: 2007, author: a1},
  {title: "The Art of Gifting", pub_date: 2006, author: a3},
  {title: "Earthly Desserts", pub_date: 2015, author: a3},
  {title: "Stay Away from the Heat", pub_date: 2018, author: a2},
  {title: "Pleasures of the Pancake", pub_date: 2015, author: a1},
  {title: "Hello to the Animals", pub_date: 1996, author: a2},
  {title: "Park Visitors from Mars", pub_date: 1989, author: a2},
  {title: "Resting on the Couch at Noon", pub_date: 2019, author: a3},
  {title: "Jealous of the Hat Man", pub_date: 2014, author: a1},
  {title: "Inside the Doorway", pub_date: 2006, author: a1},
  {title: "Fanatical Phantoms", pub_date: 2009, author: a1}
]

books.each do |book|
  b = Book.new(book)
  b.save
end

book_objects = Book.all

book_objects.each do |book|
  subjects = Subject.all
  subject_count = subjects.size
  number = (1..subject_count).to_a.sample

  all_numbers = []

  while number > 0
    subject_number = (1..subject_count).to_a.sample
    unless all_numbers.include?(subject_number)
      all_numbers << subject_number
      bs = BookSubject.new(book: book, subject: subjects[subject_number - 1])
      bs.save
    end
    number -= 1
  end
end