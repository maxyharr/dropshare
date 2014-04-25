class GroupsController < ApplicationController
  def show

  end

  def create_group
    @graph_user = FbGraph::User.me(current_user.oauth_token)
    @friends = @graph_user.friends       
  end

  def create
    group_name = params[:group]['name']
    @selected_friends = params[:group]
    # Add only those friends that were selected to members of the group
    # Members are in the form of friend.identifier, can find actual person using same method as showing friends that are using Dropshare
    group_members = []
    @selected_friends.each_pair do |key, value|
      if value == "1"
        group_members << key
      end
    end

    @group = Group.new(:name => group_name, :members => group_members)
    if @group.save
      redirect_to feed_path, notice: "The group #{@group.name} was created"
    else
      redirect_to feed_path
    end

  end

  def destroy
    group = params[:gid]
    id = group.to_i
    @group = Group.find_by_id(id).destroy rescue nil
    redirect_to feed_path, notice: "The group was deleted"
  end

end
