class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
  end

  def create_group
    @graph_user = FbGraph::User.me(current_user.oauth_token)
    @friends = @graph_user.friends       
  end

  def create
    group_name = params[:group]['name']
    @selected_friends = params[:group]
    #removing any unselected friends from members
    group_members = []
    @selected_friends.each_pair do |key, value|
      if value == "1"
        group_members << key
      end
    end
    # @group = {:group => group_name, :members => group_members}

    @group = Group.new(:name => group_name, :members => group_members)
    @group.save!
    redirect_to feed_path, notice: "The group #{@group.name} was created"
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to feed_path, notice: "The group was deleted"
  end

end
