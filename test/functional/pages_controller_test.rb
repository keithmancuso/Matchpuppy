require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get privacy" do
    get :privacy
    assert_response :success
  end

  test "should get terms" do
    get :terms
    assert_response :success
  end

end
