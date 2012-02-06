class ParksController < ApplicationController
  # GET /parks
  # GET /parks.json
  def index
     @title = "Parks"
     
    
    params[:borough] ||= "%"
    params[:park_type] ||= "%"
    
    @borough = params[:borough]
    @park_type =  params[:park_type]
    
    @parks = Park.where('borough like ? and park_type like ?', params[:borough], params[:park_type] )
    # @parks = Park.find(params[:park])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @parks }
    end
  end

  # GET /parks/1
  # GET /parks/1.json
  def show
    @park = Park.find(params[:id])
    @dogs = @park.dogs
    @other_parks = Park.where("id != ?", @park.id).where(:borough => @park.borough)
    @playdates = Playdate.where(:park_id => @park.id).upcoming
    
    @title = @park.name
    
    if current_user
      @loved = ParkLove.where(:user_id => current_user.id, :park_id => @park.id)
      if @loved.count == 0
        @park_love = ParkLove.new
        @park_love.park_id = @park.id
      end
    end
    
    
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @park }
    end
  end

  # GET /parks/new
  # GET /parks/new.json
  def new
    @park = Park.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @park }
    end
  end

  # GET /parks/1/edit
  def edit
    @park = Park.find(params[:id])
  end

  # POST /parks
  # POST /parks.json
  def create
    @park = Park.new(params[:park])

    respond_to do |format|
      if @park.save
        format.html { redirect_to @park, :notice => 'Park was successfully created.' }
        format.json { render :json => @park, :status => :created, :location => @park }
      else
        format.html { render :action => "new" }
        format.json { render :json => @park.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parks/1
  # PUT /parks/1.json
  def update
    @park = Park.find(params[:id])

    respond_to do |format|
      if @park.update_attributes(params[:park])
        format.html { redirect_to @park, :notice => 'Park was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @park.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parks/1
  # DELETE /parks/1.json
  def destroy
    @park = Park.find(params[:id])
    @park.destroy

    respond_to do |format|
      format.html { redirect_to '/admin/parks', :notice => "Park Deleted" }
      format.json { head :ok }
    end
  end
end
