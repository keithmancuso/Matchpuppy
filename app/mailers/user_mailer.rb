class UserMailer < ActionMailer::Base
  default :from => "info@matchpuppy.com"
  
  def signup(user)
    mail :to => user.email, :subject => 'Thanks for signing up for Matchpuppy'
    
  end
  
end
