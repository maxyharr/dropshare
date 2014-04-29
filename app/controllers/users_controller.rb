class UsersController < ApplicationController
  before_action :check_logged_in, :set_friends # if Rails.env != 'test'
  def feed
    friend_ids
    @activities = PublicActivity::Activity.order("created_at desc")
    @groups = Group.all
    
    # .well
#       %h2 Your groups
#       - @groups.each do |group|
#         %b= group.name
#         = link_to "Delete group", destroyGroup_path(:gid => group)
#         %br
#         - group.members.each do |member|
#           = member + ' '
#         %br
  end
  
  def show
    @user = User.find(params[:id])
    @drop_files = @user.drop_files #DropFile.all
    @sort = params[:sort]
    if !@sort.nil?
      begin 
        @drop_files = DropFile.order("#{@sort}")
      rescue ActiveRecord::StatementInvalid
        flash[:warning] = "Files can't be sorted by #{@sort}"          end
    end
    # @drop_files = DropFile.order("name")
    if @user != current_user
      @greeting = @user.name + "'s wall" 
    else
      @greeting = "Add and delete your files"
    end
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


def friend_ids
  @friend_ids = Rails.cache.fetch("friends-#{current_user.cache_key}") do
    friends = @friends
    friends.map! do |friend|
      User.find_by_uid(friend.identifier).id
    end
    friends
  end
end
