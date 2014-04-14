class StaticPagesController < ApplicationController
  def index
    $views_since_boot = $views_since_boot + 1
    redirect_to feed_path if current_user != nil   
  end

  def about
  end

  def contact
  end

  def help
  end
end
