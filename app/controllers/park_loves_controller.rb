class ParkLovesController < ApplicationController
  
  before_filter :require_user
  
  def create
    
    @park_love = ParkLove.new(params[:park_love])
    @park_love.user_id = current_user.id
    
    if @park_love.save
      redirect_to @park_love.park, :notice => 'Now you love this park.' 
      
    else
      redirect_to @park_love.park, :notice => 'Problem creating love.' 
      
    end
    
  end

  def destroy
    
    @park_love = ParkLove.find(params[:id])
    @park_love.destroy
    redirect_to 'admin/park_loves', :notice => "Park love deleted"
  end

end
