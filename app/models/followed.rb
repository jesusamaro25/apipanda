class Followed
  include Mongoid::Document
  field :userid, type: String


 # has_and_belongs_to_many :users
end
