class Playdate < ActiveRecord::Base
  belongs_to :user
  belongs_to :park
  has_many :playdate_guests, :dependent => :destroy
  has_many :dogs, :through => :playdate_guests
  has_many :comments
  has_many :users, :through => :dogs
  
  validates :park_id, :description, :presence => true
  
  #after_save :invite_guests
  
  scope :upcoming, where("playdates.play_date > ?", Time.now)
  
  private 
  
  def invite_guests
    if status = "sent"
      @playdate.playdate_guests.each do |guest| 
        PlaydateMailer.invite_guests(self, guest).deliver
      end
    end
    #PlaydateMailer.test.deliver
    #PlaydateMailer.invite_guests(self).deliver
    
  end
  
end
