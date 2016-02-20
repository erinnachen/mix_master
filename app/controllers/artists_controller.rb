class ArtistsController < ApplicationController
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
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
    @artist.save

    redirect_to artist_path(@artist.id)
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def destroy
    Artist.destroy(params[:id])
    redirect_to artists_path
  end
  
private

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end
end
