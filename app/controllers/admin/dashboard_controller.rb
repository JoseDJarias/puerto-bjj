module Admin
  class DashboardController < BaseController
    def index
      # Aquí podemos agregar estadísticas o datos relevantes para el dashboard
      @feedback_count = FeedbackMessage.count
      @recent_feedbacks = FeedbackMessage.order(created_at: :desc).limit(5)
    end
  end
end 