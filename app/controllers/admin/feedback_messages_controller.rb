class Admin::FeedbackMessagesController < Admin::BaseController
  def index
    @messages = FeedbackMessage.order(created_at: :desc)
  end

  def show
    @message = FeedbackMessage.find(params[:id])
  end
end
