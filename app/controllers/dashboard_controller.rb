class DashboardController < ApplicationController
    before_action :require_admin
  
    def index
      # Render the admin dashboard
    end
  
    private
  
    def require_admin
      unless session[:admin_logged_in]
        redirect_to admin_login_path, alert: "You must log in to access this page."
      end
    end
  end
  