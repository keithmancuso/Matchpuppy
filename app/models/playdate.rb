class Playdate < ActiveRecord::Base
  belongs_to :user
  belongs_to :park
  has_many :playdate_guests, :dependent => :destroy
  has_many :dogs, :through => :playdate_guests
  has_many :comments
  has_many :users, :through => :dogs
  
  validates :park_id, :description, :presence => true
  
  after_save :invite_guests
  
  scope :upcoming, where("playdates.play_date > ?", Time.now).order("play_date ASC")
  
  private 
  
  def invite_guests
    if self.status == "sent"
      self.users.each do |user| 
        if user != self.user
          PlaydateMailer.invite(self, user).deliver
        end
      end
      PlaydateMailer.create(self).deliver
    end
    
  end
  
  
  
end
