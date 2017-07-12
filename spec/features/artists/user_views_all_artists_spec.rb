require 'rails_helper'

RSpec.feature "User goes to artists index" do
  scenario "they see the page with all artists" do
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    existing_artist_1 = create(:artist)
    existing_artist_2 = create(:artist, name: "Rachel")

    visit '/artists'

    expect(page).to have_content("Bob")
    expect(page).to have_content("Rachel")
    expect(page).to have_link existing_artist_1.name, artist_path(existing_artist_1)
  end
end
