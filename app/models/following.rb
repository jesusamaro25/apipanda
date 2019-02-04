class Following
  include Mongoid::Document
  field :username, type: String


 # has_and_belongs_to_many :users

end
