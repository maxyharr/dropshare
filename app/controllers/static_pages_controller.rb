class StaticPagesController < ApplicationController
  def index
    $views_since_boot = $views_since_boot + 1    
  end

  def about
  end

  def contact
  end

  def help
  end
end
