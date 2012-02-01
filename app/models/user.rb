class User < ActiveRecord::Base
  acts_as_authentic
    
  has_many :dogs, :dependent => :destroy
  has_many :playdates
  has_many :park_loves
  has_many :comments
  belongs_to :park
  

  
  
  after_create :signup_email
  
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    UserMailer.password_reset(self).deliver
  end
  
  private
  
  def signup_email
    UserMailer.signup(self).deliver
  end
  
  
  
end
