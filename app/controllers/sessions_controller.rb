class SessionsController < ApplicationController
  # renders the login page
  def new
  end

  # attempts to log the user in
  def create
    @user = User.find_by(email: params[:email])
    if !@user.nil? && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  # logs the user out
  def destroy
    reset_session
    redirect_to root_path
  end
end
