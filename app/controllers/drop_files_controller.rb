class DropFilesController < ApplicationController
  def new
    @drop_file = DropFile.new
  end

  def create
    @drop_file = DropFile.new(drop_file_params)
    
    if @drop_file.save
      redirect_to wall_path, notice: "The file #{@drop_file.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @drop_file = DropFile.find(params[:id])
    @drop_file.destroy
    redirect_to wall_path, notice: "The file #{@drop_file.name} has been deleted."
  end
  
private
  def drop_file_params
    params.require(:drop_file).permit(:name, :attachment)
  end
end
