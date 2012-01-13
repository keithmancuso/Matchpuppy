require 'test_helper'

class PlaydateGuestsControllerTest < ActionController::TestCase
  setup do
    @playdate_guest = playdate_guests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:playdate_guests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create playdate_guest" do
    assert_difference('PlaydateGuest.count') do
      post :create, :playdate_guest => @playdate_guest.attributes
    end

    assert_redirected_to playdate_guest_path(assigns(:playdate_guest))
  end

  test "should show playdate_guest" do
    get :show, :id => @playdate_guest.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @playdate_guest.to_param
    assert_response :success
  end

  test "should update playdate_guest" do
    put :update, :id => @playdate_guest.to_param, :playdate_guest => @playdate_guest.attributes
    assert_redirected_to playdate_guest_path(assigns(:playdate_guest))
  end

  test "should destroy playdate_guest" do
    assert_difference('PlaydateGuest.count', -1) do
      delete :destroy, :id => @playdate_guest.to_param
    end

    assert_redirected_to playdate_guests_path
  end
end
