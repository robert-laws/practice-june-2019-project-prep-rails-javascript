class Book < ApplicationRecord
  belongs_to :author
  has_many :book_subjects
  has_many :subjects, through: :book_subjects

  scope :sorted, -> { Book.order( title: :asc )}
end
