class Admin::ContactMessagesController < ApplicationController
  def index
    @messages = ContactMessage.order(created_at: :desc)
  end

  def show
    @message = ContactMessage.find(params[:id])
  end
end
