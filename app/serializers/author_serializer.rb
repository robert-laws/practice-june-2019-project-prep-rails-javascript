class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :location
  has_many :books
end
