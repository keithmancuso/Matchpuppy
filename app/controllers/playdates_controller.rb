class PlaydatesController < ApplicationController
  # GET /playdates
  # GET /playdates.json
  def index
    @playdates = Playdate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @playdates }
    end
  end

  # GET /playdates/1
  # GET /playdates/1.json
  def show
    @playdate = Playdate.find(params[:id])
    @park = Park.find(@playdate.park_id)
    
    if @playdate.dogs
      @dogs = Dog.joins(:park).where( :parks => { :id => @park.id }).where("dogs.id not IN (?)", @playdate.dogs )
    else
      @dogs = Dog.joins(:park).where( :parks => { :id => @park.id })
    end
    
    @guests = Array.new
    
    @dogs.each do |dog| 
      
      @guests << PlaydateGuest.new(:dog_id => dog.id)
      
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @playdate }
    end
  end

  # GET /playdates/new
  # GET /playdates/new.json
  def new
    @playdate = Playdate.new
    @playdate.user_id = current_user.id
    @playdate.park_id = current_user.park_id
    
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @playdate }
    end
  end

  # GET /playdates/1/edit
  def edit
    @playdate = Playdate.find(params[:id])
  end

  # POST /playdates
  # POST /playdates.json
  def create
    @playdate = Playdate.new(params[:playdate])
    @playdate.user_id = current_user.id
    @playdate.park_id = current_user.park_id
     

    respond_to do |format|
      if @playdate.save
        format.html { redirect_to @playdate, :notice => 'Playdate was successfully created.' }
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
end
