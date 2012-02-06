class UsersController < ApplicationController
  
  # GET /users
  # GET /users.json
  def index
    @users = User.includes(:park).all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
   
    @title = @user.name
    @playdates = Playdate.joins(:users).where("users.id" => @user.id).upcoming
   
  end
  
  
  # GET /users/1
  # GET /users/1.json
  def profile
    
    @user = current_user
    @title = @user.name
    
    @playdates = Playdate.joins(:users).where("users.id" => current_user.id).upcoming

  end

  # GET /users/new
  # GET /users/new.json
  def new
  
    if current_user
      redirect_to '/account'
    else
      @user = User.new
      @dog = Dog.new
      @parks = Park.all
      @dogs = Dog.where('avatar_file_name IS NOT NULL').limit(8).order("random()")
      @upcoming_playdates = Playdate.upcoming

    end
  end

  # GET /users/1/edit
  def edit
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    @parks = Park.all
    
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    
    if @user.save
      @dog = @user.dogs.create(params[:dog])
      redirect_to edit_user_dog_path(@user, @dog), :notice => 'User successfully created'
    else
      redirect_to new_user_path, :notice => 'Sign-up failed'
    end
    
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        redirect_to '/account', :notice => 'Profile Editted'
      else
        render :action => "edit" 
      end
  
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

  end
end
