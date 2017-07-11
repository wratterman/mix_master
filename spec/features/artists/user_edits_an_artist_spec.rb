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
    # And I click on "Edit"
    click_on "Edit"

    # And I fill in a new name
    fill_in "Name", with: "Tyler"
    # And I click on "Update Artist"
    click_on "Update Artist"

    # Then I should see the artist's updated name
    # Then I should see the existing image
    expect(page).to have_content "Tyler"
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
