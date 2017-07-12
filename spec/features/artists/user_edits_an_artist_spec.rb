require 'rails_helper'

RSpec.feature "User goes to artists index" do
  scenario "they see the page with all artists" do
    existing_artist = create(:artist)
    visit artist_path(existing_artist)
    click_on "Edit"
    fill_in "Name", with: "Tyler"
    click_on "Update Artist"

    expect(page).to have_content "Tyler"
    expect(page).to have_css("img[src=\"#{existing_artist.image_path}\"]")
  end
end
