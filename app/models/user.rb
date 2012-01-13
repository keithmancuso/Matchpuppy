class User < ActiveRecord::Base
  acts_as_authentic
    
  has_many :dogs
  belongs_to :park
end
