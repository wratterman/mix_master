require 'rails_helper'

RSpec.feature 'User submits a new song' do
  scenario 'the see the page for the individual song' do
    artist = create(:artist)
    song_title = "One Love"

    # As a User
    # Given that artists exist in the database

    # When I visit the artists songs index
    visit artist_path(artist)

    # And I click "New song"
    click_on "New Song"

    # And I fill in the title
    fill_in "song_title", with: song_title

    # And I click "Create Song"
    click_on "Create Song"

    # Then I should see the song name
    # And I should see a link to the song arist's individual page
    expect(page).to have_content song_title
    expect(page).to have_link artist.name, href: artist_path(artist)
  end
end
