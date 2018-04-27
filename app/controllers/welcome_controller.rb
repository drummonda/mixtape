class WelcomeController < ApplicationController
  def index
    return unless logged_in?
    @mixes = Mix.where(user: current_user.friends).or(Mix.where(user: current_user)).order(created_at: :desc)
  end
end
