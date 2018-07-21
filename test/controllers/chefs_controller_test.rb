require 'test_helper'

class ChefsControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    get chefs_signup_url
    assert_response :success
  end

end
