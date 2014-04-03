class DriveController < ApplicationController
  def login
    session[:drive] = GoogleDrive.login(ApplicationController::DRIVE_USER, ApplicationController::DRIVE_PASS)
    redirect_to root_url
  end

  def upload
    session[:drive].upload_from_file(:uploadpath, :uploadfile, :convert => :convertTF)
  end

  def download
    filetodownload = session[:drive].file_by_title(:downloadfile)
    filetodownload.download_to_file(:downloadpath)
  end

  def logout
    session[:drive] = nil
    redirect_to root_url
  end
end
