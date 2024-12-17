class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :auto_logout

  def auto_logout
    if session[:user_id]
      session_timeout = 30.minutes

      if session[:last_seen_at] && session[:last_seen_at] < session_timeout.ago
        clear_session
        redirect_to login_path, notice: "You have been logged out due to inactivity."
      else
        session[:last_seen_at] = Time.current
      end
    end
  end
end
