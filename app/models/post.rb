class Post
  include Mongoid::Document
  field :text, type: String
  field :number, type: Integer
  field :date, type: DateTime
  belongs_to :user
end
