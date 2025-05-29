require "test_helper"

class Admin::FeedbackMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_as_admin
  end

  test "should get index" do
    get admin_feedback_messages_url
    assert_response :success
  end

  test "should get show" do
    feedback_message = feedback_messages(:one)
    get admin_feedback_message_url(feedback_message)
    assert_response :success
  end
end
