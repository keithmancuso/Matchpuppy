class UserMailer < ActionMailer::Base
  default_url_options[:host] = "matchpuppy.dev"  
  default :from => "info@matchpuppy.com"
  
  def signup(user)
    @user = user
    mail :to => user.email, :subject => 'Welcome to Matchpuppy'
    
  end
  def password_reset(user)  
    @user = user 
    @edit_password_reset_url = edit_password_reset_url(user.perishable_token)
    
    mail :to => user.email, :subject => "Reset Password"
  end
end
