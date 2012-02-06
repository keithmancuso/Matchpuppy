class ParkLovesController < ApplicationController
  
  before_filter :require_user
  
  def create
    
    @park_love = ParkLove.new(params[:park_love])
    @park_love.user_id = current_user.id
    
    if @park_love.save
      redirect_to @park_love.park, :notice => 'Love successfully created.' 
      
    else
      redirect_to @park_love.park, :notice => 'Problem creating love.' 
      
    end
    
  end

  def destroy
  end

end
