require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get createUser" do
    get user_createUser_url
    assert_response :success
  end
end
