class Artist < ActiveRecord::Base
  extend Concerns::Slugifiable::ClassMethods
  include Concerns::Slugifiable::InstanceMethods
  
  belongs_to :user
  has_many :songs
end
