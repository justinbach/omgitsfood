class MealsController < ApplicationController

  before_filter :login_required
  before_filter :store_return_point, :only => [:index]
  before_filter :get_user
  
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
    @recipes = Recipe.find_all_by_user_id(current_user, :order => "upper(title) ASC")
  end

  def create
    @meal = Meal.new(params[:meal])
    @meal.recipe = Recipe.find(params[:recipe][:id]) unless params[:recipe].nil?
    @meal.user = current_user
    @meal.recipe.user = current_user unless @meal.recipe.nil?
    if(@meal.save)
      redirect_back :action => 'index'
    else
      @recipes = Recipe.find_all_by_user_id(current_user, :order => "upper(title) ASC")
      render :action => "new"
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
    @meal = Meal.find(params[:id])
    if @meal.update_attributes(params[:meal])
      render :action => 'show'
    else
      flash[:notice] = "There was a problem updating the meal."
      render :action => 'show'
    end
  end
  
  private

  def get_user
    @user = User.find(params[:user_id])
  end

end
