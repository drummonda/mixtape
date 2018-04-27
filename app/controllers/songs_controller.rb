class SongsController < ApplicationController
  before_action :set_song, only: [:show, :destroy]
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

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)
    current_user.songs << @song

    if @song.save
      redirect_to current_user
    else
      render :new
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    if @song.users.count == 1 && (@song.users.include? current_user)
      @song.destroy
    elsif @song.users.include? current_user
      current_user.songs.delete(@song)
    end
    redirect_back(fallback_location: current_user)
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
