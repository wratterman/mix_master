require 'rails_helper'

RSpec.feature "User goes to artists index" do
  scenario "they see the page with all artists" do
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    existing_artist_1 = Artist.create(name: "Joey", image_path: artist_image_path)
    existing_artist_2 = Artist.create(name: "Rachel", image_path: artist_image_path)

    # As a user
    # Given that artists exist in the database
    expect(existing_artist_1.name).to eq(Artist.find_by(name: "Joey").name)
    expect(existing_artist_2.name).to eq(Artist.find_by(name: "Rachel").name)


    # When I visit the artists index
    visit '/artists'

    # Then I should see each artist's name
    expect(page).to have_content("Joey")
    expect(page).to have_content("Rachel")
    # And each name should link to that artist's individual page
    expect(page).to have_link existing_artist_1.name, artist_path(existing_artist_1)
  end
end
