class Review
  include Mongoid::Document
  field :title, :type => String
  field :content, :type => String
  field :book_id, :type => Integer
  belongs_to :book
end
