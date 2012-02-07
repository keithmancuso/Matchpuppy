class PlaydateMailer < ActionMailer::Base
  default :from => "woof@matchpuppy.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.playdate_mailer.invite_guests.subject
  #
  
  
  def create(playdate)
    @playdate = playdate
    mail :to => playdate.user.email, :subject =>"You created a new playdate"
  end
  
  def invite(playdate, user)
     @playdate = playdate
     @user = user
     mail :to => user.email, :subject => 'You were invited to a playdate'
  end
  
  def join(playdate, user)
    @playdate = playdate
    @user = user
    mail :to => user.email, :subject => 'You joined a playdate'
  end
  
  def new_comment(comment)
    @comment = comment
    mail :to => comment.playdate.user.email, :subject => "New comment on your playdate"
  end
  
 
end
