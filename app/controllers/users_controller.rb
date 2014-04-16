class UsersController < ApplicationController
  include Authentication
  include HelperMethods
  def feed
    redirect_to root_path if current_user == nil  
  end
  
  def wall
    redirect_to root_path if current_user == nil 
    FacebooksController#friends
  end  

end
