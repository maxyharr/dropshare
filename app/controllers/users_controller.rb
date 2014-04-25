class UsersController < ApplicationController
  before_action :check_logged_in, :set_friends # if Rails.env != 'test'
  def feed
  end
  
  def wall
    @drop_files = DropFile.all  
  end
  
  def show
    @user = User.find(params[:id])
    @drop_files = @user.drop_files #DropFile.all
  end
end


private
def check_logged_in
  redirect_to root_path if !current_user
end

def set_friends
  @friends = Rails.cache.fetch("friends-#{current_user.cache_key}") do
    friends = FbGraph::User.me(current_user.oauth_token).friends
    friends.map! do |friend|
      friend if User.find_by_uid(friend.identifier) != nil
    end
    friends.compact!
  end
end