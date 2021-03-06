class ShopsController < ApplicationController
  # GET /shops/current
  # GET /shops/current.json
  def current
    @shops = Shop.current
    @new_shop = Shop.new

    @volunteers = Volunteer.all

    # @sessions = Session.all
    # @volunteer_sessions = Session.are_volunteer
    # @visitor_sessions = Session.are_visitor



    # @new_volunteer = Volunteer.new
    @new_session = Session.new
    @new_session.shop_id = @new_shop.id

    respond_to do |format|
      format.html # current.html.erb
      format.json { render json: @shops }
    end
  end

  def close
    @shop = Shop.find(params[:id])
    @shop.sessions.current.each do |sesh|
      sesh.update_attributes :ends_at => Time.zone.now
    end
    @shop.update_attributes :ends_at => Time.zone.now
    redirect_to @shop
  end

  # GET /shops
  # GET /shops.json
  def index
    @shops = Shop.all.group_by{ |u| Time.at(u.starts_at.to_i).strftime("%Y-%m") }.sort.reverse


    respond_to do |format|
      format.html # index.html.er
      format.json { render json: @shops }
    end
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
    @shop = Shop.find(params[:id])


    @volunteers = Volunteer.all

    # @new_volunteer = Volunteer.new
    @new_session = Session.new
    @new_session.shop_id = @shop.id

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shop }
    end
  end

  # GET /shops/new
  # GET /shops/new.json
  def new
    @shop = Shop.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shop }
    end
  end

  # GET /shops/1/edit
  def edit
    @shop = Shop.find(params[:id])
  end

  # POST /shops
  # POST /shops.json
  def create
    params[:shop][:starts_at] = Chronic.parse params[:shop][:starts_at]
    params[:shop][:ends_at] = Chronic.parse params[:shop][:ends_at]

    @shop = Shop.new(params[:shop])

    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
        format.json { render json: @shop, status: :created, location: @shop }
      else
        format.html { render action: "new" }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shops/1
  # PUT /shops/1.json
  def update
    @shop = Shop.find(params[:id])

    respond_to do |format|
      if @shop.update_attributes(params[:shop])
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy

    respond_to do |format|
      format.html { redirect_to shops_url }
      format.json { head :ok }
    end
  end
end
