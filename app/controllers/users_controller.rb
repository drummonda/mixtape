class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create, :friend_requests, :all_mixes]
  before_action :authenticate_user, only: [:update, :destroy, :friend_requests, :all_songs, :all_mixes, :send_friend_request, :accept_friend_request, :delete_friend]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @mix = Mix.new
    @song = Song.new
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    redirect_to root_path unless @user == current_user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user == current_user && @user.update(user_params)
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :edit
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy if @user == current_user
    reset_session
    redirect_to users_path
  end

  # add a song
  def add_song
    @song = Song.find_by_id(params[:song_id])
    @user.add_song(@song)
    redirect_back(fallback_location: @user)
  end

  # remove a song
  def remove_song
    @song = Song.find_by_id(params[:song_id])
    @user.remove_song(@song)
    redirect_back(fallback_location: @user)
  end

  def friend_requests
  end

  def send_friend_request
    current_user.send_friend_request(@user)
    redirect_back(fallback_location: @user)
  end

  def accept_friend_request
    current_user.accept_friend_request(@user)
    redirect_back(fallback_location: current_user)
  end

  def delete_friend
    current_user.delete_friend(@user)
    redirect_back(fallback_location: current_user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
