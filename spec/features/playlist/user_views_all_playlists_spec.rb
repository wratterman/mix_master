require 'rails_helper'

RSpec.feature "User goes to playlist index" do
  scenario "they see the page with all playlists" do
    playlist = create(:playlist)

    visit playlists_path

    expect(page).to have_content playlist.name
    expect(page).to have_link playlist.name, playlist_path(playlist)
  end
end
