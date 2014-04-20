class UsersController < ApplicationController
  def feed
    redirect_to root_path if current_user == nil  
  end
  
  def wall
    redirect_to root_path if current_user == nil
    @drop_files = DropFile.all  
  end
  
  def show
    @user = User.find(params[:id])
    @drop_files = DropFile.all 
  end
end
