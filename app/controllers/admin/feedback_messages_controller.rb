class Admin::FeedbackMessagesController < Admin::BaseController
  def index
    @per_page = params.fetch(:per_page, 10).to_i
    @per_page = 10 unless [5, 10, 20, 50].include?(@per_page)
    @messages = FeedbackMessage.order(created_at: :desc).page(params[:page]).per(@per_page)
  end

  def show
    @message = FeedbackMessage.find(params[:id])
  end

  def destroy
    @message = FeedbackMessage.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to admin_feedback_messages_path, notice: "Mensaje eliminado exitosamente" }
    end
  end

  def batch_destroy
    if params[:select_all_global] == 'true'
      # Si se seleccionaron todos los registros, eliminamos todos
      FeedbackMessage.delete_all
      flash[:success] = "Todos los mensajes han sido eliminados exitosamente"
    elsif params[:message_ids].present?
      # Si solo se seleccionaron registros de la página actual
      count = params[:message_ids].size
      FeedbackMessage.where(id: params[:message_ids]).destroy_all
      flash[:success] = "#{count} mensaje#{count != 1 ? 's' : ''} eliminado#{count != 1 ? 's' : ''} exitosamente"
    else
      flash[:error] = "No se seleccionaron mensajes para eliminar"
    end

    redirect_to admin_feedback_messages_path, status: :see_other
  end

  def ids
    render json: { ids: FeedbackMessage.pluck(:id) }
  end
end
