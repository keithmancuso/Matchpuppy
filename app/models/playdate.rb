class Playdate < ActiveRecord::Base
  belongs_to :user
  belongs_to :park
  has_many :playdate_guests
  has_many :dogs, :through => :playdate_guests
end
