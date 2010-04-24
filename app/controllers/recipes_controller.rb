class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all(:order => "created_at DESC")
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:recipe][:id])
    if @recipe.update_attributes(params[:recipe])
      flash[:notice] = "Recipe was successfully updated."
      redirect_to(:controller => "recipes", :action => "index")
    else
      flash[:notice] = @recipe.errors
      render :action => "edit"
    end
  end
end
