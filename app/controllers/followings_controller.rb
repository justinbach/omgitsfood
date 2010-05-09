class FollowingsController < ApplicationController
  
  before_filter :login_required
  
  def create
    @following = Following.new
    @following.user = current_user
    @following.followee = User.find(params[:followee])
    if @following.save
      flash[:notice] = "You are now following #{@following.followee.username}."
      redirect_to :back
    else
      flash[:notice] = "Something went wrong."
      redirect_to :back
    end
  end
  
  def destroy
    @following = Following.find(:first, 
                  :conditions => {
                    :user_id => current_user.id, 
                    :followee_id => params[:followee]})
    if @following.destroy
      flash[:notice] = "You are no longer following #{@following.followee.username}."
      redirect_to :back
    else
      flash[:notice] = "Something went wrong."
      redirect_to :back
    end
  end
end
