class DogsController < ApplicationController
  
  before_filter :get_user, :except => :index
  
  
  # GET /dogs
  # GET /dogs.json
  def index
    @title = "Dogs"
    
    @dogs = Dog.all
    
    
  end

  # GET /dogs/1
  # GET /dogs/1.json
  def show
    @dog = Dog.find(params[:id])
    @user = @dog.user
    
    @title = @dog.name
    
     @playdates = Playdate.joins(:dogs).where("dogs.id" => @dog.id).where("play_date > ?", Time.now)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @dog }
    end
  end

  # GET /dogs/new
  # GET /dogs/new.json
  def new
    @dog = Dog.new
    @dog.user_id = current_user.id
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @dog }
    end
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
    @dog = @user.dogs.create(params[:dog])
    
    redirect_to parks_path
    
    
  end

  # PUT /dogs/1
  # PUT /dogs/1.json
  def update
    @user = User.find(params[:user_id])
    
    @dog = Dog.find(params[:id])
    
   
    
    
     respond_to do |format|
           if @dog.update_attributes(params[:dog])
             format.html { redirect_to parks_path, :notice => 'Dog was successfully updated.' }
             format.json { head :ok }
           else
             format.html { render :action => "edit" }
             format.json { render :json => @dog.errors, :status => :unprocessable_entity }
           end
    end
  end

  # DELETE /dogs/1
  # DELETE /dogs/1.json
  def destroy
    @dog = Dog.find(params[:id])
    
    if current_user.user_type == "admin" or current_user = @dog.user
      @dog.destroy
    else 
      redirect_to root_path, :notice => "Not allowed to delete someone elses dog!"
    end
    redirect_to account_path 
     
  end
  
 
  def get_user
    @user = User.find(params[:user_id])
    
  end
  
end
