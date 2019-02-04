class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :username, type: String
  field :password, type: String
  field :name, type: String
  field :lastname, type: String
  field :bio, type: String
  field :photo, type: String

  has_many :post
  has_many :following
  has_many :followed
 # has_and_belongs_to_many :followings
  #has_and_belongs_to_many :followeds
  validates :username, uniqueness: true

end
