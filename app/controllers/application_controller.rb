class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private

  #login information for our drive
  DRIVE_USER = "testermctestingstons@gmail.com"
  DRIVE_PASS = "dropshare"
  $views_since_boot = 0
  # ensure drive is logged on 
  # before_action :check_login
#   def check_login
#     if session[:drive]
#     else
#       session[:drive] = GoogleDrive.login(ApplicationController::DRIVE_USER, ApplicationController::DRIVE_PASS)
#       redirect_to root_url
#     end
#   end
  
  # Below this line added from omniauth-facebook tutorial
  def current_user
    @current_user ||= User.find(session[:user_pubid]) if session[:user_pubid]
  end
  
  def current_drive
    @current_drive ||= User.find(session[:drive]) if session[:drive]
  end
  
  helper_method :current_drive
  helper_method :current_user
end
