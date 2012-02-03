class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.includes(:park).all
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
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
    @playdates = Playdate.joins(:users).where("users.id" => @user.id).where("play_date > ?", Time.now)
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end
  
  
  # GET /users/1
  # GET /users/1.json
  def profile
    
    @user = current_user
    @title = @user.name
    
    @playdates = Playdate.joins(:users).where("users.id" => current_user.id).where("play_date > ?", Time.now)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
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
      @dogs = Dog.find(:all, :conditions => 'avatar_file_name IS NOT NULL')
    
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @user }
      end
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

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to '/account', :notice => 'Profile Editted' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
