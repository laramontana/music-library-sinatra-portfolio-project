class User < ActiveRecord::Base
  has_secure_password
  has_many :songs
  has_many :artists, through: :songs

  validates :username, presence: true, uniqueness: true
end
