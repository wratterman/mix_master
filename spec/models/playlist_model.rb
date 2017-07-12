require 'rails_helper'

RSpec.describe Playlist, "associations", type: :model do
  Song.create(title: "This", artist_id: 1)
  Playlist.create(name: "This playlist")
  PlaylistSong.create(song_id: 1, playlist_id: 1)
  it { should have_many(:playlist_songs) }
  it { should have_many(:songs).through(:playlist_songs) }
end
