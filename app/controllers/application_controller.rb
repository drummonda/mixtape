class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_mix, :logged_in?

  def logged_in?
    session[:user_id]
  end

  def current_user
    @current_user ||= session[:user_id] && User.find(session[:user_id])
  end

  def authenticate_user
    return if logged_in?
    redirect_to root_path
  end
end
