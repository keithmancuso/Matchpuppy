class PlaydateGuest < ActiveRecord::Base
  belongs_to :playdate
  belongs_to :dog
end
