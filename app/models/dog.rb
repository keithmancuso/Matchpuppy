class Dog < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  belongs_to :user
  has_many :playdate_guests
  has_one :park, :through => :user
  has_many :playdates, :through => :playdate_guests
  
  
end
