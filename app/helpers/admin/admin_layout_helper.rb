module Admin::AdminLayoutHelper
    def hide_admin_header_footer?
      # Controllers and actions where you want to hide the header and footer
      ["sessions", "passwords"].include?(controller_name) && ["new"].include?(action_name)
    end
end
