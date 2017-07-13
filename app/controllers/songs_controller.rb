class SongsController < ApplicationController
  before_action :set_artist, only: [:new, :create]
  before_action :set_song, only: [:show]

  def new
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def show
    @song
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
