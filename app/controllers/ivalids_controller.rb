class IvalidsController < ApplicationController
  # GET /ivalids
  # GET /ivalids.json
  def index
    @ivalids = Ivalid.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ivalids }
    end
  end

  # GET /ivalids/1
  # GET /ivalids/1.json
  def show
    @ivalid = Ivalid.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ivalid }
    end
  end

  # GET /ivalids/new
  # GET /ivalids/new.json
  def new
    @ivalid = Ivalid.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ivalid }
    end
  end

  # GET /ivalids/1/edit
  def edit
    @ivalid = Ivalid.find(params[:id])
  end

  # POST /ivalids
  # POST /ivalids.json
  def create
    @ivalid = Ivalid.new(params[:ivalid])

    respond_to do |format|
      if @ivalid.save
        format.html { redirect_to @ivalid, notice: 'Ivalid was successfully created.' }
        format.json { render json: @ivalid, status: :created, location: @ivalid }
      else
        format.html { render action: "new" }
        format.json { render json: @ivalid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ivalids/1
  # PUT /ivalids/1.json
  def update
    @ivalid = Ivalid.find(params[:id])

    respond_to do |format|
      if @ivalid.update_attributes(params[:ivalid])
        format.html { redirect_to @ivalid, notice: 'Ivalid was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ivalid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ivalids/1
  # DELETE /ivalids/1.json
  def destroy
    @ivalid = Ivalid.find(params[:id])
    @ivalid.destroy

    respond_to do |format|
      format.html { redirect_to ivalids_url }
      format.json { head :no_content }
    end
  end
end
