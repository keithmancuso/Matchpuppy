class Playdate < ActiveRecord::Base
  belongs_to :user
  belongs_to :park
  has_many :playdate_guests, :dependent => :destroy
  has_many :dogs, :through => :playdate_guests
  has_many :comments
  has_many :users, :through => :dogs
  
  validates :park_id, :description, :presence => true
  
  after_save :invite_guests
  
  scope :upcoming, where("playdates.play_date > ?", Time.now)
  
  private 
  
  def invite_guests
    if status = "sent"
      self.users.each do |user| 
        PlaydateMailer.invite(self, user).deliver
      end
      PlaydateMailer.create(self).deliver
    end
    
  end
  
  
  
end
