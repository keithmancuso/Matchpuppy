class PlaydateGuest < ActiveRecord::Base
  belongs_to :playdate
  belongs_to :dog
  has_one :user, :through => :dog
end
