class MealsController < ApplicationController

  before_filter :login_required
  
  def index
    @yesterdays_meals = Meal.find_all_by_day(Date.yesterday, 
                              :conditions => ['user_id = ?', current_user])
    @todays_meals = Meal.find_all_by_day(Date.today,
                              :conditions => ['user_id = ?', current_user])
    @tomorrows_meals = Meal.find_all_by_day(Date.tomorrow,
                              :conditions => ['user_id = ?', current_user])
  end

  def new
    @meal = Meal.new
    @meal.day = params[:day]
    @meal.recipe = Recipe.new
  end

  def create
    @meal = Meal.new(params[:meal])
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
