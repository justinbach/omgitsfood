class RecipesController < ApplicationController
  
  include RecipeScraper
  
  before_filter :login_required
  
  def index
    @user_recipes = Recipe.find_all_by_user_id(current_user, 
                                            :order => "upper(title) ASC")
    @other_recipes = Recipe.find(:all, 
      :conditions => [ "user_id != :user_id", {:user_id => current_user}], 
                                            :order => "upper(title) ASC")
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
    if @recipe.user == current_user
      render :action => "edit"
    else
      render :action => "show"
    end
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:recipe][:id])
    if @recipe.update_attributes(params[:recipe])
      flash[:notice] = "#{@recipe.title} was successfully updated."
      redirect_to(:controller => "recipes", :action => "index")
    else
      render :action => "show"
    end
  end
  
  def recipe_by_link
    @recipe = load_recipe params[:link]
    if @recipe
      render :text  => @recipe.to_json
    else
      render :text => "{ 'failed': true }"
    end
  end
  
  def add_to_collection
    @recipe = Recipe.new(Recipe.find(params[:id]).attributes)
    @recipe.original_recipe = Recipe.find(params[:id])
    @recipe.user = current_user
    if @recipe.save
      flash[:notice] = "'#{@recipe.title}' has been successfully added to your collection."
      redirect_to :action => "index"
    else
      flash[:notice] = "We were unable to add '#{@recipe.title}' to your collection."
      redirect_to :action => "index"
    end
  end
  
  private
  
end
