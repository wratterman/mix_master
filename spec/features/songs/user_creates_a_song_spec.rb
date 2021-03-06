require 'rails_helper'

RSpec.feature 'User submits a new song' do
  scenario 'the see the page for the individual song' do
    artist = create(:artist)
    song_title = "One Love"

    visit artist_path(artist)
    click_on "New Song"
    fill_in "Title", with: song_title
    click_on "Create Song"

    expect(page).to have_current_path artist_path(artist)
    expect(page).to have_link song_title, href: song_path(Song.last)
  end
end
