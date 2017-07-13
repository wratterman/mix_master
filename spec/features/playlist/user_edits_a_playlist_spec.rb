require 'rails_helper'

RSpec.feature "User goes to playlists index" do
  scenario "they see the page with all playlists" do
    existing_playlist = create(:playlist)
    existing_playlist.songs.create(title: "TBD", artist_id: 1)
    song1 = existing_playlist.songs.first
    song2 = create(:song)
    name = "Will"

    visit playlist_path(existing_playlist)
    click_on "Edit"
    fill_in "playlist_name", with: name
    check("song-#{song2.id}")

    click_on "Update Playlist"

    expect(page).to have_content name
    expect(page).to have_link song2.title
  end
end
