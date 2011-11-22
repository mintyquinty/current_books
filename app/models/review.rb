class Review
  include Mongoid::Document
  field :title, :type => String
  field :content, :type => String
  field :book_id, :type => Integer
  field :rating, :type => String
  belongs_to :book
end
