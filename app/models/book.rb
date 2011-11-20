class Book
  include Mongoid::Document
  include Mongoid::Timestamps
  field :ISBN, :type => String
  field :Format, :type => String
  field :FormatEditionName, :type => String
  field :Edition, :type => String
  field :EditionNumber, :type => String
  field :PublisherCompanyName, :type => String
  field :PublisherDate, :type => Date
  field :Pages, :type => String
  field :Illustrated, :type => Boolean
  field :Price, :type => Float
  field :IsAdult, :type => Boolean
  field :IsFiction, :type => Boolean
  field :TitleArticle, :type => String
  field :Title, :type => String
  field :SubTitle, :type => String
  field :LanguageName, :type => String
  field :Keywords, :type => String
  field :Priority, :type => Integer
  field :LastUpdatedTS, :type => Date
  field :VolumeNumber, :type => Integer
  field :AuthorFirstName, :type => String
  field :AuthorLastName, :type => String
  has_many :reviews
end
