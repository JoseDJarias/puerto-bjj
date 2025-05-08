class ContactsController < ApplicationController
  def new
    @contact_message = ContactMessage.new
  end

  def create
    @contact_message = ContactMessage.new(contact_message_params)
    if @contact_message.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to contactanos_path, notice: "Gracias por tu mensaje" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_message_params
    params.require(:contact_message).permit(:name, :email, :message)
  end
end
