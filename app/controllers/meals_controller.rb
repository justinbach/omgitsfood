class MealsController < ApplicationController

  before_filter :login_required
  before_filter :store_return_point, :only => [:index]
  
  def index
    @centerDate = params[:d] ? Date.parse(params[:d]) : Date.today
    @left_meals = Meal.find_all_by_day(@centerDate - 1, 
                              :conditions => ['user_id = ?', current_user])
    @center_meals = Meal.find_all_by_day(@centerDate,
                              :conditions => ['user_id = ?', current_user])
    @right_meals = Meal.find_all_by_day(@centerDate + 1,
                              :conditions => ['user_id = ?', current_user])
  end
  
  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
    @meal.day = params[:day]
    @meal.recipe = Recipe.new
    @recipes = Recipe.all(:order, "upper(title) ASC")
  end

  def create
    @meal = Meal.new(params[:meal])
    @meal.recipe = Recipe.find(params[:recipe][:id]) unless params[:recipe].nil?
    @meal.user = @meal.recipe.user = current_user
    if(@meal.save)
      redirect_back :action => 'index'
    else
      flash[:notice] = "uh oh"
    end
  end

  def destroy
    if Meal.find(params[:id]).destroy
      flash[:notice] = "Meal succesfully deleted."
      redirect_back :action => 'index'
    else
      flash[:notice] = "Something went wrong."
      redirect_back :action => 'index'
    end
  end

  def update
  end
  
  private


end
