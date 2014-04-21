class UsersController < ApplicationController

  def feed
    redirect_to root_path if current_user == nil
    @graph_user = FbGraph::User.me(current_user.oauth_token)
    @friends = @graph_user.friends
    
    # cache the user's friends (at least for now - long render time otherwise ~4sec)
  end
  
  def wall
    redirect_to root_path if current_user == nil
    @drop_files = DropFile.all  
  end
  
  def show
    @user = User.find(params[:id])
    @drop_files = @user.drop_files #DropFile.all
  end
end
