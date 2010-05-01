module MealsHelper
  
  def dayTitle day
    if day == Date.today
      "<h2 class='today'>#{day.strftime("%a %b %d, %Y")}</h2>"
    else
      "<h2>#{day.strftime("%a %b %d, %Y")}</h2>"
    end
  end  
  
  def addMealLink day
    link_to "add a meal", { 
      :day => day.strftime("%b-%d-%Y"), 
      :controller => "meals", 
      :action => "new", 
      :user_id => current_user }, 
      :class => "addMealLink" unless @user != current_user
  end
end
