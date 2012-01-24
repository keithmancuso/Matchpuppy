class Dog < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :storage => :s3,
      :bucket => 'matchpuppy-dev',
      :s3_credentials => {
        :access_key_id => '017YBYNZGR3HVZ600X02',
        :secret_access_key => 'qxbQK061zbEB2dFws7WOYtrqU6rYOuUyCnM0T9hY'
      }
  
  belongs_to :user
  has_many :playdate_guests
  has_one :park, :through => :user
  has_many :playdates, :through => :playdate_guests
  
  
end
