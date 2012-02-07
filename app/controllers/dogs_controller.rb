class DogsController < ApplicationController
  
  before_filter :get_user, :except => :index
  before_filter :set_controller
  
  
  # GET /dogs
  # GET /dogs.json
  def index
    @title = "Dogs"
    @dogs = Dog.paginate :page => params[:page], :order => 'created_at DESC'
    
  end

  # GET /dogs/1
  # GET /dogs/1.json
  def show
    @dog = Dog.find(params[:id])
    @user = @dog.user
    @title = @dog.name
    @playdates = Playdate.joins(:dogs).where("dogs.id" => @dog.id).where("play_date > ?", Time.now)
    @other_dogs = Dog.where("breed = ? and dogs.id <> ?", @dog.breed,@dog.id).limit(3).order("random()")
  
  end

  # GET /dogs/new
  # GET /dogs/new.json
  def new
    @dog = Dog.new
    @dog.name = flash[:dog_name]
    @dog.user_id = current_user.id

  end

  # GET /dogs/1/edit
  def edit
    @user = User.find(params[:user_id])
    @dog = Dog.find(params[:id])
  end

  # POST /dogs
  # POST /dogs.json
  def create
    @user = User.find(params[:user_id])
    @dog = @user.dogs.new(params[:dog])
    
    if @dog.save
      if @user.dogs.count == 1
        redirect_to parks_path
      else
        redirect_to account_path
      end
    else
      render :action => "new"
    end
  end

  # PUT /dogs/1
  # PUT /dogs/1.json
  def update
    @user = User.find(params[:user_id])
    @dog = Dog.find(params[:id])

    if @dog.update_attributes(params[:dog])
      redirect_to parks_path, :notice => 'Dog was successfully updated.' 
    else
      render :action => "edit" 
    end
  end

  # DELETE /dogs/1
  # DELETE /dogs/1.json
  def destroy
    @dog = Dog.find(params[:id])
    
    if current_user.user_type == "admin" or current_user = @dog.user
      @dog.destroy
      redirect_to account_path 
    else 
      redirect_to root_path, :notice => "Not allowed to delete someone elses dog!"
    end
     
  end
  
 
 
  private
  
  def get_user
    @user = User.find(params[:user_id])
  end
  
  def set_controller
    @controller = 'dogs'
  end
  
end
