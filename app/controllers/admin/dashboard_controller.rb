module Admin
  class DashboardController < BaseController
    def index
      @feedback_count = FeedbackMessage.count
      @recent_feedbacks = FeedbackMessage.order(created_at: :desc).limit(5)
    end
  end
end 