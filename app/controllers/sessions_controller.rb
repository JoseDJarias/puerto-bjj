class SessionsController < ApplicationController
  layout "admin_layout"
  include Admin::AdminLayoutHelper
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
    redirect_to admin_root_path if authenticated? && Current.user.admin?
  end

  def create
    if user = User.authenticate_by(params.permit(:email_address, :password))
      if user.admin?
        start_new_session_for user
        redirect_to after_authentication_url, notice: "Sesión iniciada correctamente"
      else
        redirect_to new_session_path, alert: "Acceso denegado. Solo administradores pueden acceder."
      end
    else
      flash.now[:alert] = "Email o contraseña incorrectos. Por favor verifica tus credenciales."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path, notice: "Sesión cerrada correctamente."
  end
end
