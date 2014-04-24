class UsersController < ApplicationController
  before_action :check_logged_in if Rails.env != 'test'
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

  def create_group    
    @graph_user = FbGraph::User.me(current_user.oauth_token)
    @friends = @graph_user.friends
    @group_of_friends = params[:group]
    
  end

  def create
    g = params[:group]
    group_name = g[:title]
    @selected_friends = params[:members]
    #removing any unselected friends from group
    group_members = []
    @selected_friends.each_pair do |key, value|
      if value == "1"
        group_members << key
      end
    end
    @group = {:group => group_name, :members => group_members}
  end

end
