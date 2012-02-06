class PlaydateMailer < ActionMailer::Base
  default :from => "woof@matchpuppy.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.playdate_mailer.invite_guests.subject
  #
  def create(playdate)
    
    
    
  end
  
  
  def test
      mail :to => "keithmancuso@gmail.com", :subject => 'test email'
  end
end
