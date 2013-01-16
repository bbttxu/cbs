require 'chronic'

class SessionsController < ApplicationController
  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sessions }
    end
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    @session = Session.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @session }
    end
  end

  # GET /sessions/new
  # GET /sessions/new.json
  def new
    @session = Session.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @session }
    end
  end

  # GET /sessions/1/edit
  def edit
    @session = Session.find(params[:id])
  end

  # POST /sessions
  # POST /sessions.json
  def create
    params[:session][:starts_at] = Chronic.parse params[:session][:starts_at] if params[:session][:starts_at]
    params[:session][:ends_at] = Chronic.parse params[:session][:ends_at] if params[:session][:ends_at]
    @session = Session.new(params[:session])

    # if params[:session][:volunteer_id].to_s == "0"
    #   redirect_to new_volunteer_path
    # end

    @volunteer = Volunteer.find_by_id( params[:session][:volunteer_id] )

    redirect_to new_volunteer_path, :notice => 'You must sign in to add an item to your cart.' and return if @volunteer == nil

    @volunteer.open_sessions.each do |session|
      session.update_attributes :ends_at => Time.now
    end

    respond_to do |format|
      if @session.save
        format.html { redirect_to "/", notice: 'Session was successfully created.' }
        format.json { render json: @session, status: :created, location: @session }
      else
        format.html { render action: "new" }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sessions/1
  # PUT /sessions/1.json
  def update
    params[:session][:starts_at] = Chronic.parse params[:session][:starts_at]
    params[:session][:ends_at] = Chronic.parse params[:session][:ends_at]
    @session = Session.find(params[:id])

    respond_to do |format|
      if @session.update_attributes(params[:session])
        format.html { redirect_to shop_url(@session.shop) , notice: 'Session was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session = Session.find(params[:id])
    @session.destroy

    respond_to do |format|
      format.html { redirect_to sessions_url }
      format.json { head :ok }
    end
  end
end
