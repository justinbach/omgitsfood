# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def showFlash
    if flash[:notice]
      "<div id='flash'>#{flash[:notice]}</div>"
    end
  end
end
