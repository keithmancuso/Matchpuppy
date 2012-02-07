class PlaydatesController < ApplicationController
  # GET /playdates
  # GET /playdates.json
  before_filter :require_user, :except => :index
  before_filter :set_controller
  
  def index
    @title = "Playdates"
    @playdates = Playdate.upcoming
    
  end

  # GET /playdates/1
  # GET /playdates/1.json
  def show
    @playdate = Playdate.find(params[:id])
    @playdate_guests = @playdate.playdate_guests

    @park = Park.find(@playdate.park_id)
    @guests = Array.new

    @other_playdates = Playdate.where(:park_id => @park.id)
    
    @title = "Playdate for " + l(@playdate.play_date, :format => :playdate)
    
    current_user.dogs.each do |dog|
      @active_guests = @playdate.playdate_guests.where(:dog_id => dog.id)
    end
    
    
    if current_user == @playdate.user
      if @playdate.dogs.empty?
        @dogs = @playdate.park.dogs
      else
        @dogs = @playdate.park.dogs.where("dogs.id not IN (?)", @playdate.dogs )
      end
    
      @dogs.each do |dog| 
        @guests << PlaydateGuest.new(:dog_id => dog.id)
      end
    
    else
      current_user.dogs.each do |dog|
        @guests << PlaydateGuest.new(:dog_id => dog.id)
      end
    end

  end

  # GET /playdates/new
  # GET /playdates/new.json
  def new
    @playdate = Playdate.new
    @playdate.user_id = current_user.id
    @playdate.park_id = current_user.park_id
    @parks = Park.joins(:users).where("users.id" => current_user.id)
    
    @other_playdates = Array.new
    
    @title = "New Playdate"
    
    current_user.parks.each do |park|
      @other_playdates = Playdate.upcoming.where(:park_id => park.id)
    end
    
    
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @playdate }
    end
  end

  # GET /playdates/1/edit
  def edit
    @playdate = Playdate.find(params[:id])
    @parks = Park.all
    
  end

  def join
    @playdate = Playdate.find(params[:id])
    current_user.dogs.each do |dog|
      @playdate.playdate_guests.create(:dog_id => dog.id, :rsvp=>"Yes") 
      
    end
    
    redirect_to @playdate, :notice => "You've successfully joined this playdate"
  end
  
  def rsvp
    @playdate = Playdate.find(params[:id])
    
    current_user.dogs.each do |dog|
      @playdate_guest = @playdate.playdate_guests.where(:dog_id => dog.id)
      @playdate_guest.first.update_attributes(:rsvp=>params[:rsvp])
    end
    
    redirect_to @playdate, :notice => "RSVP Updated"
    
  end

  
  # POST /playdates
  # POST /playdates.json
  def create
    @playdate = Playdate.new(params[:playdate])
    @playdate.user_id = current_user.id
    current_user.dogs.each do |dog|
      @playdate.playdate_guests.new(:dog_id => dog.id, :rsvp=>"Yes") 
     
    end
    
    

    respond_to do |format|
      if @playdate.save
        format.html { redirect_to @playdate, :notice => 'Playdate was successfully created. Invite some dogs who love this park.' }
        format.json { render :json => @playdate, :status => :created, :location => @playdate }
      else
        format.html { render :action => "new" }
        format.json { render :json => @playdate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /playdates/1
  # PUT /playdates/1.json
  def update
    @playdate = Playdate.find(params[:id])

    respond_to do |format|
      if @playdate.update_attributes(params[:playdate])
        format.html { redirect_to @playdate, :notice => 'Playdate was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @playdate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /playdates/1
  # DELETE /playdates/1.json
  def destroy
    @playdate = Playdate.find(params[:id])
    @playdate.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :ok }
    end
  end
  
  
  private
  
  def set_controller
     @controller = 'playdates'
   end
  
 
  
end
