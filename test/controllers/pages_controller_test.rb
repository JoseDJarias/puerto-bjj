require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get explore" do
    get root_url
    assert_response :success
  end

  test "should get about" do
    get "/acerca-de-nosotros"
    assert_response :success
  end
end
