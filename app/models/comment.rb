class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :playdate
  has_one :park, :through => :playdate
  
end
