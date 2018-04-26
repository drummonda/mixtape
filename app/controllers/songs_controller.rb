class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:show, :edit, :update, :destroy]

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
    redirect_to root_path unless @song.user == current_user
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = current_user.songs.new(song_params)

    if @song.save
      redirect_to @song.user
    else
      render :new
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    if @song.user == current_user && @song.update(song_params)
      redirect_to @song.user
    else
      render :edit
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy if @song.user == current_user
    redirect_back(fallback_location: @song.user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:song_title, :song_artist, :mp3)
    end
end
