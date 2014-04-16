module ApplicationHelper
  include Authentication::HelperMethods

  def fb_graph_url
    'http://github.com/nov/fb_graph'
  end

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Dropshare"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
