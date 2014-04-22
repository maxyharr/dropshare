class UsersController < ApplicationController
  before_action :check_logged_in
  def check_logged_in
    redirect_to root_path if !current_user
  end
  
  def feed
    if !Rails.env.test?
      @graph_user = FbGraph::User.me(current_user.oauth_token)
      @friends = @graph_user.friends
    end

    
    # cache the user's friends (at least for now - long render time otherwise ~4sec)
  end
  
  def wall
    @drop_files = DropFile.all  
  end
  
  def show
    @user = User.find(params[:id])
    @drop_files = @user.drop_files #DropFile.all
  end
end
