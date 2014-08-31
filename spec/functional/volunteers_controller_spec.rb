require 'spec_helper'

include AuthHelper

describe VolunteersController, :type => :controller do

  before(:each) do
    http_login
    @volunteer = FactoryGirl.build "volunteer"
  end

  describe "index" do
    it "should show volunteers" do
      get :index
      response.should be_success
    end
  end

  describe "new" do
    it "should show volunteers" do
      get :new
      response.should be_success
    end
  end

  describe "create" do
    it "should add a volunteer" do
      assert_difference('Volunteer.count') do
        post :create, volunteer: @volunteer.attributes
      end

      assert_redirected_to volunteer_path(assigns(:volunteer))
    end
  end

  describe "show" do
    it "should show volunteers" do
      @volunteer.save!
      get :show, id: @volunteer
      response.should be_success
    end
  end

  describe "edit" do
    it "should edit" do
      @volunteer.save!
      get :edit, id: @volunteer.attributes
      assert_response :success
    end
  end

  describe "update" do
    it "should update volunteer" do
      @volunteer.save
      put :update, id: @volunteer.to_param, volunteer: @volunteer.attributes
      assert_redirected_to volunteer_path(assigns(:volunteer))
    end
  end

  describe "destroy" do
    it "should remove a volunteer" do
      @volunteer.save
      # volunteer = FactoryGirl.create :volunteer
      assert_difference('Volunteer.count', -1) do
        delete :destroy, id: @volunteer.to_param
      end

      assert_redirected_to volunteers_path
    end
  end
end
# class VolunteersControllerTest < ActionController::TestCase
#   setup do
#     @volunteer = volunteers(:one)
#   end

#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:volunteers)
#   end

#   test "should get new" do
#     get :new
#     assert_response :success
#   end

#   test "should create volunteer" do
#     assert_difference('Volunteer.count') do
#       post :create, volunteer: @volunteer.attributes
#     end

#     assert_redirected_to volunteer_path(assigns(:volunteer))
#   end

#   test "should show volunteer" do
#     get :show, id: @volunteer.to_param
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, id: @volunteer.to_param
#     assert_response :success
#   end

#   test "should update volunteer" do
#     put :update, id: @volunteer.to_param, volunteer: @volunteer.attributes
#     assert_redirected_to volunteer_path(assigns(:volunteer))
#   end

#   test "should destroy volunteer" do
#     assert_difference('Volunteer.count', -1) do
#       delete :destroy, id: @volunteer.to_param
#     end

#     assert_redirected_to volunteers_path
#   end
# end
