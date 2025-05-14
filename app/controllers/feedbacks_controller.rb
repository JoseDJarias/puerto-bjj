class FeedbacksController < ApplicationController
  allow_unauthenticated_access
  def new
    @feedback_message = FeedbackMessage.new
  end

  def create
    @feedback_message = FeedbackMessage.new(feedback_message_params)

    if @feedback_message.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to feedback_path, notice: "Gracias por tu opinión" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def feedback_message_params
    params.require(:feedback_message).permit(:name, :email, :message)
  end
end
