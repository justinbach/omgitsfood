module RecipesHelper
  def editRecipeLinkDisplay
    if @recipe.user == current_user
      link_to "Edit this recipe", {:action => "edit", :id => @recipe}, :class => "utilityLink"
    end
  end
  
  def recipeMealLink r
    link_to (r.meals.select { |m| 
        m.user_id == current_user.id 
        }.last.day.strftime('%a %b %d, %Y'), 
      user_meal_path(current_user.id, 
        r.meals.select { |m| 
          m.user_id == current_user.id 
          }.last),
      :class => 'recipeMealLink')
  end  
  
end
