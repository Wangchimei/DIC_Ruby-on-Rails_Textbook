class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
      flash[:notice] = "Successfully Logged in"
    else
      flash.now[:danger] = "Failed to log in"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "Successfully Logged out"
    redirect_to new_session_path
  end
end
