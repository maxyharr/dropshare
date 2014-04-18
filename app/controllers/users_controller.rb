class UsersController < ApplicationController
  include Authentication
  include HelperMethods
  def feed
    if authenticated?
      friends
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

  def friends
    @friends = []
    current_user.profile.friends.each do |friend|
      @friends << friend.name
    end
    @friends.sort!
  end
  
  def group_friends
  end
end
