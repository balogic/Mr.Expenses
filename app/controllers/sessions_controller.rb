class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log in
      log_in(user)
      redirect_to user
    else
      #Error Message
      flash.now[:danger] = "Invalid Credentials"
    render 'new'
  end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
