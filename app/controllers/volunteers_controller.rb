class VolunteersController < ApplicationController
  # GET /volunteers
  # GET /volunteers.json
  def index
    @last_active = params['last_active'] || nil

    puts @last_active

    # @volunteers = Volunteer.all.group_by{ |u| u.last_name_initial.upcase }.sort
    @volunteer = Volunteer.new

    @volunteers = Volunteer.all

    if @last_active
      @volunteers = @volunteers.collect{|x|x if x.last_active(@last_active)}
      @volunteers.reject!{|x|x == nil}
      # puts @volunteers, "hi"
    end
    puts @volunteers.count

    @volunteers = @volunteers.group_by{ |u| u.last_name_initial.upcase }.sort


    # @emails = Volunteer.where(:can_email => true, :email.exists => true).collect{|x|x.email}


    @emails = Volunteer.where(:can_email => true, :email.exists => true).all

    if @last_active
      @emails = @emails.collect{|x| x if x.last_active(@last_active)}
    end

    @emails = @emails.collect{|x|x.email}


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @volunteers }
    end
  end


  # GET /volunteers/mailing
  # GET /volunteers/mailing.json
  def mailing

    last_active = params['last_active'] || Chronic.parse("90 days ago")
    @volunteers = Volunteer.where(:can_email => true, :email.exists => true)

    @volunteers = @volunteers.collect{|x|x.email if x.last_active(last_active)}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @volunteers }
    end
  end


  # GET /volunteers/1
  # GET /volunteers/1.json
  def show
    @volunteer = Volunteer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @volunteer }
    end
  end

  # GET /volunteers/new
  # GET /volunteers/new.json
  def new
      # @volunteer = Volunteer.find_by_email(params[:email])
      @volunteer = Volunteer.new

      # unless @volunteer.nil?
      #   redirect_to @volunteer
      # end

    # @volunteer = Volunteer.find_or_create_by_email(params[:email])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @volunteer }
    end
  end

  # GET /volunteers/1/edit
  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  # POST /volunteers
  # POST /volunteers.json
  def create
    @volunteer = Volunteer.new(params[:volunteer])

    respond_to do |format|
      if @volunteer.save
        format.html { redirect_to @volunteer, notice: 'Volunteer was successfully created.' }
        format.json { render json: @volunteer, status: :created, location: @volunteer }
      else
        format.html { render action: "new" }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /volunteers/1
  # PUT /volunteers/1.json
  def update
    @volunteer = Volunteer.find(params[:id])

    respond_to do |format|
      if @volunteer.update_attributes(params[:volunteer])
        format.html { redirect_to @volunteer, notice: 'Volunteer was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volunteers/1
  # DELETE /volunteers/1.json
  def destroy
    @volunteer = Volunteer.find(params[:id])
    @volunteer.destroy

    respond_to do |format|
      format.html { redirect_to volunteers_url }
      format.json { head :ok }
    end
  end
end
