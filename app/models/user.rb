class User < ActiveRecord::Base
  acts_as_authentic
    
  has_many :dogs, :dependent => :destroy
  has_many :playdates
  has_many :park_loves
  belongs_to :park
  
  after_save :signup_email
  
  private
  
  def signup_email
    UserMailer.signup(self).deliver
  end
  
end
