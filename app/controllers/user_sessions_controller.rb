class UserSessionsController < ApplicationController
  
	def new
		@user_session = UserSession.new
	end
	
	def create
		@user_session = UserSession.new(params[:user_session])
		if @user_session.save
      redirect_to show_user_dog_path(@user), :notice => 'Successfully logged in'
		else      
      redirect_to new_user_session_path, :notice => 'Invalid Login'
    end
		
  end
	
	def destroy
    @user_session = UserSession.find
    @user_session.destroy
    redirect_to user_sessions_url, :notice => "Logged out!"
	end
  
  def show
    @user_session = UserSession.find
    
  end

end