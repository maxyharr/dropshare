class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  # Record the controller on each request allowing us to access it on the model
  include PublicActivity::StoreController
  
  protect_from_forgery with: :exception
  
  
  # has to be public to be considered an action by PublicActivity
  # using hide_action to keep it private (official workaround)
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  hide_action :current_user
  
  
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
  
  def current_drive
    @current_drive ||= User.find(session[:drive]) if session[:drive]
  end
  
  helper_method :current_drive
end
