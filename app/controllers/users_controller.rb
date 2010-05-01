class UsersController < ApplicationController
  
  before_filter :login_required, :except => [:new, :create]
  
  def index
    @users = User.find(:all, 
                :conditions => ["username != :username", {:username => current_user.username}])
  end
  
  def show
    redirect_to user_meals_path(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
end
