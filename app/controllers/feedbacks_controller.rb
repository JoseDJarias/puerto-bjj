class FeedbacksController < ApplicationController
  allow_unauthenticated_access
  def new
    @feedback_message = FeedbackMessage.new
  end

  def create
    @feedback_message = FeedbackMessage.new(feedback_message_params)

    if @feedback_message.save
      render partial: "feedbacks/success"
    else
      render partial: "feedbacks/error", status: :unprocessable_entity
    end
  end

  private

  def feedback_message_params
    params.require(:feedback_message).permit(:name, :email, :message)
  end
end
