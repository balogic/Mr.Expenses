class UsersController < ApplicationController
  before_action :logged_in_user




  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:success] = "Welcome to Mr.Expenses!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end


  private
  def user_params
  	params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Log in to Continue"
      redirect_to login_url
    end
  end
end
