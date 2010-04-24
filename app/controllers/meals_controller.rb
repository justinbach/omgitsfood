class MealsController < ApplicationController

  before_filter :login_required
  
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
    @recipes = Recipe.all
  end

  def create
    @meal = Meal.new(params[:meal])
    @meal.recipe = Recipe.find_or_create_by_id(params[:meal][:recipe])
    @meal.user = current_user
    if(@meal.save)
      redirect_to :action => 'index'
    else
      flash[:notice] = "uh oh"
    end
  end

  def destroy
    if Meal.find(params[:id]).destroy
      flash[:notice] = "Meal succesfully deleted."
      redirect_to :action => 'index'
    else
      flash[:notice] = "Something went wrong."
      redirect_to :action => 'index'
    end
  end

  def update
  end
  
  private


end
