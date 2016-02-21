class SongsController < ApplicationController
  def show
    @song = Song.find(params[:id])
    @artist = Artist.find(@song.artist_id)
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
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
end
