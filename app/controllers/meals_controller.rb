class MealsController < ApplicationController
  def index
    @yesterdays_meals = Meal.find_all_by_day(Date.yesterday)
    @todays_meals = Meal.find_all_by_day(Date.today)
    @tomorrows_meals = Meal.find_all_by_day(Date.tomorrow)
  end

  def new
    @meal = Meal.new
    @meal.day = params[:day]
    @meal.recipe = Recipe.new
  end

  def create
    @meal = Meal.new(params[:meal])
    if(@meal.save)
      redirect_to :action => 'index'
    else
      flash[:notice] = "uh oh"
    end
  end

  def destroy
  end

  def update
  end

end