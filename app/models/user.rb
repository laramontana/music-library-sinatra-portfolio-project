class User < ActiveRecord::Base
  has_secure_password
  has_many :artists
  has_many :songs, through: :artists
end
