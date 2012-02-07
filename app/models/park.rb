class Park < ActiveRecord::Base
  
  has_many :playdates
  has_many :playdate_guests, :through => :playdates
  has_many :park_loves
  has_many :users, :through => :park_loves
  has_many :dogs, :through => :users
  
  
  
  def current_love
    if UserSession.find
      @park_love = ParkLove.where(:park_id => self.id, :user_id => UserSession.find.user.id)
      if @park_love.any?
        return true
      else
        return false
      end
    else 
      return false
    end
    
  end
  
end
