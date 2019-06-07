BookSubject.delete_all
Subject.delete_all
Book.delete_all
Author.delete_all

authors = [
  {name: "Bob Cobb", age: 34, location: "Chicago"},
  {name: "Hal Hope", age: 39, location: "New York"},
  {name: "Jim Jupe", age: 52, location: "Boston"},
  {name: "Kal Kool", age: 27, location: "Houston"},
  {name: "Mel Mope", age: 43, location: "Los Angeles"},
  {name: "Don Dome", age: 38, location: "Miami"},
  {name: "Abe Area", age: 26, location: "New Orleans"},
  {name: "Val Vine", age: 35, location: "Seattle"}
]

subjects = [
  {name: "art"},
  {name: "history"},
  {name: "travel"},
  {name: "cooking"},
  {name: "fishing"},
  {name: "sports"}
]

authors.each do |author|
  Author.create(author)
end

subjects.each do |subject|
  Subject.create(subject)
end

books = [
  {title: "Book of Fun", pub_date: 2012},
  {title: "New Things Happened", pub_date: 1985},
  {title: "Golf Time in the Rain", pub_date: 1999},
  {title: "Reading with Cookies", pub_date: 2011},
  {title: "Train to Town", pub_date: 1995},
  {title: "Water on the Flowerpot", pub_date: 2001},
  {title: "Racing for Daylight", pub_date: 2004},
  {title: "Knights of the Dinner Roll", pub_date: 1998},
  {title: "Keeping in One Spot", pub_date: 2017},
  {title: "Cat Cousins", pub_date: 2011},
  {title: "Imagining Some New Stars", pub_date: 2012},
  {title: "Purple Liver", pub_date: 2008},
  {title: "Under the Bridge to the Garage", pub_date: 2002},
  {title: "Yellow Vines for Blue Flowers", pub_date: 1992},
  {title: "Need to Run Home", pub_date: 2007},
  {title: "The Art of Gifting", pub_date: 2006},
  {title: "Earthly Desserts", pub_date: 2015},
  {title: "Stay Away from the Heat", pub_date: 2018},
  {title: "Pleasures of the Pancake", pub_date: 2015},
  {title: "Hello to the Animals", pub_date: 1996},
  {title: "Park Visitors from Mars", pub_date: 1989},
  {title: "Resting on the Couch at Noon", pub_date: 2019},
  {title: "Jealous of the Hat Man", pub_date: 2014},
  {title: "Inside the Doorway", pub_date: 2006},
  {title: "Fanatical Phantoms", pub_date: 2009}
]

author_ids = Author.all.map { |a| a.id }

books.each do |book|
  b = Book.new(book)
  b.author_id = author_ids.sample
  b.save
end

subject_ids = Subject.all.map { |s| s.id }

Book.all.each do |book|
  random_number = (1..subject_ids.size).to_a.sample
  all_numbers = []

  while random_number > 0
    subject_number = subject_ids.sample
    unless all_numbers.include?(subject_number)
      all_numbers << subject_number
      bs = BookSubject.new(book: book, subject_id: subject_number)
      bs.save
    end
    random_number -= 1
  end
end