class PlaydateGuestMailer < ActionMailer::Base
  default :from => "info@matchpuppy.com"
  
  
  def invite(guest)
    @playdate = playdate
    @playdate_guest = playdate_guest
    mail :to => playdate_guest.user.email, :subject => 'You were invited to a playdate'
   
  end
end
