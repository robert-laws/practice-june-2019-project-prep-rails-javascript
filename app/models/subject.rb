class Subject < ApplicationRecord
  has_many :book_subjects
  has_many :subjects, through: :book_subjects
end
