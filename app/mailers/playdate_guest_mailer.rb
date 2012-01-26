class PlaydateGuestMailer < ActionMailer::Base
  default :from => "info@matchpuppy.com"
  
  
  def invite(guest)
    @guest = guest
    @playdate = guest.playdate
      mail :to => guest.user.email, :subject => 'You are invited', :from => "info@matchpuppy.com"
  end
end
