class Dog < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :storage => :s3,
      :bucket => 'MatchPuppy',
      :s3_credentials => {
        :access_key_id => 'AKIAJYTNN7664YXLY5KA',
        :secret_access_key => '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'
      }, 
      :default_url => '/images/default-dog.png'
  
  belongs_to :user
  has_many :playdate_guests
  has_one :park, :through => :user
  has_many :playdates, :through => :playdate_guests
  has_many :park_loves, :through => :user
  
end
