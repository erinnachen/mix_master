class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @artist.update(artist_params)
    @artist.save

    redirect_to artist_path(@artist.id)
  end

  def show
  end

  def destroy
    Artist.destroy(@artist.id)
    redirect_to artists_path
  end

private

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end
end
