class TopController < ApplicationController
  include Authentication
  include HelperMethods

  def index
    @friends = []
    current_user.profile.friends.each do |friend|
      @friends << friend.name
    end
    @friends.sort!
  end
  
  def friends
    @friends = []
    @current_user.profile.friends.each do |friend|
      @friends << friend.name
    end
    @friends
  end
  
end
