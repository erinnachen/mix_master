class SongsController < ApplicationController
  before_action :set_artist, only: [:new, :create]

  def show
    @song = Song.find(params[:id])
    @artist = Artist.find(@song.artist_id)
  end

  def new
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to song_path(@song.id)
    else
      render :new
    end
  end

private
  def song_params
    params.require(:song).permit(:title)
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
end
