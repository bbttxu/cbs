require 'spec_helper'

include AuthHelper

describe SessionsController, :type => :controller do

  before(:each) do
    http_login
    @shop = FactoryGirl.create :shop
    @session = FactoryGirl.create "session"

    @shop.sessions << @session
  end

  describe "index" do
    it "should show sessions" do
      get :index
      response.should be_success
    end
  end

  describe "new" do
    it "should show sessions" do
      get :new
      response.should be_success
    end
  end

  describe "create" do
    it "should add a session" do
      # @newsession = FactoryGirl.build :session
      # @shop.sessions << @newsession

      # assert_difference('Session.count') do
      #   post :create, session: @newsession.attributes
      # end

      # assert_redirected_to shop_path(@shop)
      pending("further investigation")

      assert false

    end
  end

  describe "show" do
    it "should show sessions" do
      @session.save!
      get :show, id: @session
      response.should be_success
    end
  end

  describe "edit" do
    it "should edit" do
      @session.save!
      get :edit, id: @session.attributes
      assert_response :success
    end
  end

  describe "update" do
    it "should update session" do
      @session.save
      put :update, id: @session.to_param, session: @session.attributes
      assert_redirected_to shop_path(@shop)
    end
  end

  describe "destroy" do
    it "should remove a session" do
      @session.save
      # session = FactoryGirl.create :session
      assert_difference('Session.count', -1) do
        delete :destroy, id: @session.to_param
      end

      assert_redirected_to sessions_path
    end
  end
end
