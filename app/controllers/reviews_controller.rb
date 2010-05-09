class ReviewsController < ApplicationController
  def new
  end
  
  def create
    @review = Review.new(params[:review])
    if @review.save
      flash[:notice] = 'Review successfully added.'
      redirect_to user_meal_path(current_user, @review.meal)
    else
      flash[:notice] = 'There was a problem creating your review.'
      redirect_to user_meal_path(current_user, @review.meal)
    end
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(params[:review])
      flash[:notice] = 'Review successfully updated.'
      redirect_to user_meal_path(@review.user_id, @review.meal_id)
    else
      flash[:notice] = "There was a problem updating the review."
      redirect_to user_meal_path(@review.user_id, @review.meal_id)
    end
  end
end
