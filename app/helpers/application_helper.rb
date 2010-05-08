# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def showFlash
    if flash[:notice]
      "<div id='flash'>#{flash[:notice]}</div>"
    end
  end
  
  def navLink text, path, controller 
    if params[:controller] == controller
      link_to text, path, :class => 'navActive'
    else
      link_to text, path
    end
  end
  
end
