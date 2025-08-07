module PathResolver
  extend ActiveSupport::Concern

  private

  def resolve_path(path_string)
    # Convert string path to actual Rails path helper
    case path_string
    when "feedback_path"
      feedback_path
    when "kids_program_path"
      kids_program_path
    when "programs_path"
      programs_path
    else
      # Try to call the path helper dynamically
      send(path_string)
    end
  rescue NoMethodError => e
    handle_path_error(path_string, e)
  end

  def handle_path_error(path_string, error)
    # Log the error for debugging (only in development/test)
    Rails.logger.warn "Path helper not found: #{path_string} - #{error.message}" if Rails.env.development? || Rails.env.test?

    # Return a safe fallback based on the path type
    case path_string
    when /_path$/
      "#" # Internal route fallback
    when /^https?:\/\//
      path_string # External URL - keep as is
    when /^mailto:/
      path_string # Email link - keep as is
    when /^tel:/
      path_string # Phone link - keep as is
    else
      "#" # Default fallback
    end
  end
end
