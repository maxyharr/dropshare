class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private

  #login information for our drive
  DRIVE_USER = "testermctestingstons@gmail.com"
  DRIVE_PASS = "dropshare"

  before_action :check_drive
  def check_drive
    if session[:drive] == nil
      redirect_to drive_login_path
    end
  end


  # Below this line added from omniauth-facebook tutorial
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_drive
    @current_drive ||= User.find(session[:drive]) if session[:drive]
    
  end
  
  helper_method :current_drive
  helper_method :current_user
end
