class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all(:order => "created_at DESC")
    respond_to do |format|
      format.html
    end
  end
end
