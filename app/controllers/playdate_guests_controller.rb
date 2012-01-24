class PlaydateGuestsController < ApplicationController
  # GET /playdate_guests
  # GET /playdate_guests.json
  def index
    @playdate_guests = PlaydateGuest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @playdate_guests }
    end
  end

  # GET /playdate_guests/1
  # GET /playdate_guests/1.json
  def show
    @playdate_guest = PlaydateGuest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @playdate_guest }
    end
  end

  # GET /playdate_guests/new
  # GET /playdate_guests/new.json
  def new
    @playdate_guest = PlaydateGuest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @playdate_guest }
    end
  end

  # GET /playdate_guests/1/edit
  def edit
    @playdate_guest = PlaydateGuest.find(params[:id])
  end

  # POST /playdate_guests
  # POST /playdate_guests.json
  def create
    @playdate_guest = PlaydateGuest.new(params[:playdate_guest])
    
    @playdate = Playdate.find(params[:playdate_id])
    @playdate_guest = @playdate.playdate_guests.new(params[:playdate_guest])

    respond_to do |format|
      if @playdate_guest.save
        format.html { redirect_to @playdate, :notice => 'Playdate guest was successfully created.' }
        format.json { render :json => @playdate_guest, :status => :created, :location => @playdate_guest }
      else
        format.html { redirect_to @playdate, :notice => 'ERROR - Playdate guest was not invited .' }
        format.json { render :json => @playdate_guest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /playdate_guests/1
  # PUT /playdate_guests/1.json
  def update
    @playdate_guest = PlaydateGuest.find(params[:id])
    @playdate = Playdate.find(params[:playdate_id])
    
    respond_to do |format|
      if @playdate_guest.update_attributes(params[:playdate_guest])
        format.html { redirect_to @playdate, :notice => 'Playdate guest was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @playdate_guest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /playdate_guests/1
  # DELETE /playdate_guests/1.json
  def destroy
    @playdate_guest = PlaydateGuest.find(params[:id])
    @playdate_guest.destroy

    respond_to do |format|
      format.html { redirect_to playdate_guests_url }
      format.json { head :ok }
    end
  end
end
