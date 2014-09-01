require 'spec_helper'

include AuthHelper

describe ShopsController, :type => :controller do

  before(:each) do
    http_login
    @shop = FactoryGirl.build "shop"
  end

  describe "index" do
    it "should show shops" do
      get :index
      expect(response).to be(200)
    end
  end

  describe "new" do
    it "should show shops" do
      get :new
      response.should be_success
    end
  end

  describe "create" do
    it "should add a shop" do
      assert_difference('Shop.count') do
        post :create, shop: @shop.attributes
      end

      assert_redirected_to shop_path(assigns(:shop))
    end
  end

  describe "close" do
    it "should close a shop" do
      @openshop = FactoryGirl.create :shop, ends_at: ""
      put :close, id: @openshop
      assert_redirected_to shop_path(assigns(:shop))
    end
  end

  describe "show" do
    it "should show shops" do
      @shop.save!
      get :show, id: @shop
      response.should be_success
    end
  end

  describe "edit" do
    it "should edit" do
      @shop.save!
      get :edit, id: @shop.attributes
      assert_response :success
    end
  end

  describe "update" do
    it "should update shop" do
      @shop.save
      put :update, id: @shop.to_param, shop: @shop.attributes
      assert_redirected_to shop_path(assigns(:shop))
    end
  end

  describe "destroy" do
    it "should remove a shop" do
      @shop.save
      # shop = FactoryGirl.create :shop
      assert_difference('Shop.count', -1) do
        delete :destroy, id: @shop.to_param
      end

      assert_redirected_to shops_path
    end
  end
end
