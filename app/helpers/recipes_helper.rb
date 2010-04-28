module RecipesHelper
  def edit_recipe_link_display
    if @recipe.user == current_user
      link_to "Edit this recipe", {:action => "edit", :id => @recipe}, :class => "utilityLink"
    end
  end
end
