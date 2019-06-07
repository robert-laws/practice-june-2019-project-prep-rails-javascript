class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :pub_date
end
