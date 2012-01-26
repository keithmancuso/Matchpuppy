class LovesController < ApplicationController
  # GET /loves
  # GET /loves.json
  def index
    @loves = Love.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @loves }
    end
  end

  # GET /loves/1
  # GET /loves/1.json
  def show
    @Love = Love.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @Love }
    end
  end

  # GET /loves/new
  # GET /loves/new.json
  def new
    @Love = Love.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @Love }
    end
  end

  # GET /loves/1/edit
  def edit
    @Love = Love.find(params[:id])
  end

  # POST /loves
  # POST /loves.json
  def create
    @Love = Love.new(params[:Love])

    respond_to do |format|
      if @Love.save
        format.html { redirect_to @Love, :notice => 'Love was successfully created.' }
        format.json { render :json => @Love, :status => :created, :location => @Love }
      else
        format.html { render :action => "new" }
        format.json { render :json => @Love.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /loves/1
  # PUT /loves/1.json
  def update
    @Love = Love.find(params[:id])

    respond_to do |format|
      if @Love.update_attributes(params[:Love])
        format.html { redirect_to @Love, :notice => 'Love was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @Love.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /loves/1
  # DELETE /loves/1.json
  def destroy
    @Love = Love.find(params[:id])
    @Love.destroy

    respond_to do |format|
      format.html { redirect_to loves_url }
      format.json { head :ok }
    end
  end
end
