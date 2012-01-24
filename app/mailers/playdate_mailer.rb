class PlaydateMailer < ActionMailer::Base
  default :from => "do-not-reply@matchpuppy.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.playdate_mailer.invite_guests.subject
  #
  def invite_guests(playdate)
    @playdate = playdate
    @playdate.playdate_guests.each do |guest| 
      mail :to => guest.user.email, :subject => 'You were invited to a playdate'
    end
  end
end
