class Park < ActiveRecord::Base
  has_many :users
  has_many :playdates
  has_many :playdate_guests, :through => :playdates
  has_many :dogs, :through => :users
  
end
