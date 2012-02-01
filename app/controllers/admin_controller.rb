class AdminController < ApplicationController
  before_filter :check_admin
  
  
  def parks
    @parks = Park.all
  end
  
  def dogs
    @dogs = Dog.all
  end
  
  def users
    @users = User.all
  end
  
  def comments
    @comments = Comment.all
  end
  
  private
  
  def check_admin
   if current_user.user_type != "admin"
     redirect_to root_path, :notice => "Unauthorized Access"
   end
  end
end
