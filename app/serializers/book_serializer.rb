class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :pub_date
  belongs_to :author, serializer: BookAuthorSerializer
  has_many :subjects, serializer: BookSubjectSerializer
end
