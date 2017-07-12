require 'rails_helper'

RSpec.feature "User goes to artists index" do
  scenario "they see the page with all artists" do
    existing_artist = create(:artist)

    visit artist_path(existing_artist)
    click_on "Delete"

    expect(page).to have_current_path(artists_path)
    expect(page).to_not have_content(existing_artist.name)
  end
end
