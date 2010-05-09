# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def showFlash
    if flash[:notice]
      "<div id='flash'>#{flash[:notice]}</div>"
    end
  end
  
  # this is hackish
  def navLink text, path, controller
    if controller == "meals"
      if @user == current_user
        return (link_to text, path, :class => 'navActive')        
      else
        return (link_to text, path)
      end
    end
    if controller == "users"
      if params[:controller] == "meals" && @user != current_user
        return (link_to text, path, :class => 'navActive')
      else
        return (link_to text, path)
      end
    end
    if params[:controller] == controller
      return (link_to text, path, :class => 'navActive')
    else
      return (link_to text, path)
    end
  end
  
end
