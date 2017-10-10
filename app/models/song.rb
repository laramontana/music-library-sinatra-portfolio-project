class Song < ActiveRecord::Base
  belongs_to :artist
  delegate :user, to: :artist
  # https://stackoverflow.com/questions/7834073/how-to-setup-a-kind-of-belongs-to-through-without-setting-up-a-direct-belongs
end
