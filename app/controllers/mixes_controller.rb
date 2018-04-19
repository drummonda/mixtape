class MixesController < ApplicationController
  before_action :set_mix, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:show, :edit, :update, :destroy]

  # GET /playlists
  # GET /playlists.json
  def index
    @mixes = Mix.all
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
  end

  # GET /playlists/new
  def new
    @mix = Mix.new
  end

  # GET /playlists/1/edit
  def edit
    redirect_to root_path unless @mix.user == current_user
  end

  # POST /playlists
  # POST /playlists.json
  def create
    @mix = current_user.mixes.new(mix_params)

    if @mix.save
      redirect_to @mix.user
    else
      render :new
    end
  end

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update
    if @mix.user == current_user && @mix.update(mix_params)
      redirect_to @mix.user
    else
      render :edit
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    @mix.destroy if @mix.user == current_user
    redirect_back(fallback_location: @mix.user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mix
      @mix = Mix.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mix_params
      params.require(:mix).permit(:mix_name, :user_id)
    end
end
