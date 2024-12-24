class SessionsController < ApplicationController
  def new
    # Render login form
  end

  def create
    if params[:password] == "Gdghack2024"
      session[:admin_logged_in] = true
      redirect_to dashboard_path, notice: "Logged in successfully!"
    else
      flash[:alert] = "Invalid password"
      render :new
    end
  end

  def destroy
    session[:admin_logged_in] = nil
    redirect_to login_path, notice: "Logged out successfully!"
  end
end
