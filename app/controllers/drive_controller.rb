class DriveController < ApplicationController
  def login
    session[:drive] = GoogleDrive.login(ApplicationController::DRIVE_EMAIL, ApplicationController::DRIVE_PASSWORD)
    redirect_to root_url
  end

  def upload
    session[:drive].upload_from_file(uploadpath, uploadfile, :convert => convertTF)
    
  end

  def download(file, path)
    @filetodownload = session[:drive].file_by_title(downloadfile)
    @filetodownload.download_to_file(path)
  end

  def logout
    session[:drive] = nil
    redirect_to root_url
  end
end
