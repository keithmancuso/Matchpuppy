class PlaydateGuest < ActiveRecord::Base
  belongs_to :playdate
  belongs_to :dog
  has_one :user, :through => :dog
  has_one :park, :through => :playdate
  
  scope :yes, where(:rsvp => 'Yes')
  scope :no, where(:rsvp => 'No')
  scope :maybe, where(:rsvp => 'Maybe')
  
  after_save :invite
   
  def invite
    #PlaydateGuestMailer.invite(self).deliver
    
  end
end
