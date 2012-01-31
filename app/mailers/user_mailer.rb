class UserMailer < ActionMailer::Base
  default_url_options[:host] = "matchpuppy.dev"  
  default :from => "info@matchpuppy.com"
  
  def signup(user)
    mail :to => user.email, :subject => 'Thanks for signing up for Matchpuppy'
    
  end
  def password_reset(user)  
    @user = user 
    @edit_password_reset_url = edit_password_reset_url(user.perishable_token)
    
    mail :to => user.email, :subject => "Reset Password"
  end
end
