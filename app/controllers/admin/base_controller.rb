module Admin
  class BaseController < ApplicationController
    layout "admin_layout"
    helper Admin::AdminLayoutHelper
    
    before_action :require_admin
    
    private
    
    def require_admin
      unless Current.user&.admin?
        redirect_to new_session_path, alert: "Acceso denegado. Se requiere permisos de administrador."
      end
    end
  end
end 