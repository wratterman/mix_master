require 'rails_helper'

RSpec.feature "User goes to playlists index" do
  scenario "they see the page with all playlists" do
    existing_playlist = create(:playlist)
    song1 = create(:song)
    song2 = existing_playlist.songs.create
    name = "Will"

    visit playlist_path(existing_playlist)
    click_on "Edit"
    fill_in "playlist_name", with: name
    check("song-#{song1.id}")
    uncheck("song-#{song2.id}")

    click_on "Update Playlist"

    expect(page).to have_content name
    expect(page).to have_content song1.title
    expect(page).to not_have_content song2.title
  end
end
