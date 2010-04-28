# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
  end
  
  def show_title?
    @show_title
  end
  
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end
  
  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
  
  # thanks to http://groups.google.co.in/group/rubyonrails-talk/browse_thread/thread/cce32744dd41ff83
  def nav_link_to(name, location, controller) 
    if params[:controller] == controller
      html_options = { :class => 'navActive' }
    else
      html_options = {}
    end
    link_to name, location, html_options
  end
  
end
