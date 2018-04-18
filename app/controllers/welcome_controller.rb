class WelcomeController < ApplicationController
  def index
    @mixtape = Mixtape.new
    return unless logged_in?
    @mixtapes = Mixtape.where(user: current_user.friends).or(Mixtape.where(user: current_user)).order(created_at: :desc)
  end
end
