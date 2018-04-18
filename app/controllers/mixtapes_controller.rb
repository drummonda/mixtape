class PlaylistsController < ApplicationController
  before_action :set_mixtape, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:show, :edit, :update, :destroy]

  # GET /playlists
  # GET /playlists.json
  def index
    @mixtapes = Mixtape.all
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
  end

  # GET /playlists/new
  def new
    @mixtape = Mixtape.new
  end

  # GET /playlists/1/edit
  def edit
    redirect_to root_path unless @mixtape.user == current_user
  end

  # POST /playlists
  # POST /playlists.json
  def create
    @mixtape = current_user.mixtapes.new(mixtape_params)

    if @mixtape.save
      redirect_to @mixtape.user
    else
      render :new
    end
  end

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update
    if @mixtape.user == current_user && @mixtape.update(mixtape_params)
      redirect_to @mixtape.user
    else
      render :edit
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    @mixtape.destroy if @mixtape.user == current_user
    redirect_back(fallback_location: @mixtape.user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mixtape
      @mixtape = Mixtape.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mixtape_params
      params.require(:mixtape).permit(:mixtape_name, :user_id)
    end
end
