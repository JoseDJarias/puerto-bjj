require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get explore" do
    get root_url
    assert_response :success
  end

  test "should get about us" do
    get "/about-us"
    assert_response :success
  end
end
