class Song < ActiveRecord::Base
  extend Concerns::Slugifiable::ClassMethods
  include Concerns::Slugifiable::InstanceMethods

  belongs_to :artist
  belongs_to :user
end
