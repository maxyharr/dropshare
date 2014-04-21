class DropFilesController < ApplicationController
  before_action :check_logged_in
  def check_logged_in
    redirect_to root_path if !session[:user_id]
  end
  
  def new
    @drop_file = DropFile.new
  end

  def create
    @drop_file = current_user.drop_files.build(drop_file_params)
    
    if @drop_file.save
      redirect_to user_path(current_user.id), notice: "The file #{@drop_file.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @drop_file = DropFile.find(params[:id])
    @drop_file.destroy
    redirect_to user_path(current_user.id), notice: "The file #{@drop_file.name} has been deleted."
  end
  
private
  def drop_file_params
    params.require(:drop_file).permit(:name, :attachment)
  end
end
