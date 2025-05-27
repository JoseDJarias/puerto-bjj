module Admin::AdminLayoutHelper
    def hide_admin_header_footer?
      # Aquí defines los controladores y acciones donde NO quieres mostrar header y footer
      ["sessions", "passwords"].include?(controller_name) && ["new", "new"].include?(action_name)
    end
  end
  