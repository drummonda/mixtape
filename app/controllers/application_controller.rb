class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def logged_in?
    session[:user_id]
  end

  def current_user
    return unless User.exists?(session[:user_id])
    @current_user = User.find(session[:user_id])
    @current_user
  end

  def authenticate_user
    return if User.exists?(session[:user_id])
    redirect_to root_path
  end
end
