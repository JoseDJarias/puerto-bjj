require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get explore" do
    get home_explore_url
    assert_response :success
  end
end
