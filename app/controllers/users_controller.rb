class UsersController < ApplicationController
  include Authentication
  include HelperMethods
  def feed
    if authenticated?
      FacebooksController#friends
    else
      redirect_to root_path
    end
  end
  
  def wall
    if authenticated?
      
    else
      redirect_to root_path
    end
  end  

end
