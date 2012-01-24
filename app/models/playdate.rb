class Playdate < ActiveRecord::Base
  belongs_to :user
  belongs_to :park
  has_many :playdate_guests
  has_many :dogs, :through => :playdate_guests
  
  after_save :invite_guests
  
  private 
  
  def invite_guests
    PlaydateMailer.invite_guests(self).deliver
  end
  
end
