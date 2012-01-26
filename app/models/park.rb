class Park < ActiveRecord::Base
  
  has_many :playdates
  has_many :playdate_guests, :through => :playdates
  has_many :park_loves
  has_many :users, :through => :park_loves
  has_many :dogs, :through => :users
  
  
  
end
