class TopController < ApplicationController
  include Authentication
  include HelperMethods

  def index
    if authenticated?
      redirect_to wall_path
    end
  end
    
end
