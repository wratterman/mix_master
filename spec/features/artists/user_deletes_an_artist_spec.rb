require 'rails_helper'

RSpec.feature "User goes to artists index" do
  scenario "they see the page with all artists" do
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    existing_artist = Artist.create(name: "Joey", image_path: artist_image_path)

    # As a user
    # Given that an artist exists in the database
    expect(existing_artist.name).to eq(Artist.find_by(name: "Joey").name)

    # When I visit that artist's show page
    visit artist_path(existing_artist)
    # And I click on "Delete"
    click_on "Delete"

    # Then I should be back on the artist index page
    expect(page).to have_current_path(artists_path)
    # Then I should not see the artist's name
    expect(page).to_not have_content("Joey")
  end
end
