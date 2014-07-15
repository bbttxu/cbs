require 'spec_helper'



describe VolunteersController, :type => :controller do
  before(:each) do
    @volunteer = FactoryGirl.create "volunteer"
  end

  describe "index" do
    it "should show volunteers" do
      get :index
      response.should == 1
      # response.should be_success
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
