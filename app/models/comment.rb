class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :playdate
  has_one :park, :through => :playdate
  
  after_save :notify
  
  
  private
  
  def notify
    PlaydateMailer.new_comment(self).deliver
  end
  
  
end
