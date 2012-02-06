class User < ActiveRecord::Base
 
  acts_as_authentic do |c|
          c.merge_validates_format_of_email_field_options :message => 'invalid email'
  end
  
  
  has_many :dogs, :dependent => :destroy
  has_many :playdates
  has_many :park_loves
  has_many :comments
  has_many :parks, :through => :park_loves
  
  validates :name, :email, :password, :presence => true

  
  
  after_create :signup_email
  
  
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    UserMailer.password_reset(self).deliver
  end
  
  private
  
  def signup_email
    UserMailer.signup(self).deliver
  end
  
  
  def mailing_list
    h = Hominid::API.new('eef9cbf1cbad4b743302e591e036190d-us4')
    h.list_subscribe(22865, 'joe@public.com', {'FNAME' => 'Joe', 'LNAME' => 'Public'}, 'html', false, true, true, false)
    
  end
  
  
end
