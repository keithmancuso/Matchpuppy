require 'test_helper'

class PlaydateMailerTest < ActionMailer::TestCase
  test "invite_guests" do
    mail = PlaydateMailer.invite_guests
    assert_equal "Invite guests", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
