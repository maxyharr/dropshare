class UploadController < ApplicationController

  def upload
    name = params[:upload][:file].original_filename
    directory = "public/images/upload"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| 
      f.write(params[:upload][:file].read) }
    flash[:notice] = "File uploaded"
    redirect_to "/drive/upload"
  end

end
