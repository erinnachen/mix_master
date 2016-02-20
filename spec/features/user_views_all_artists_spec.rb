require 'rails_helper'

RSpec.feature "User submits a new artist" do
  scenario "they see the page for all artists in the database" do
    Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    Artist.create(name: "Taylor Swift", image_path: "https://upload.wikimedia.org/wikipedia/commons/b/b2/Taylor_Swift_Red_Tour_2%2C_2013.jpg")

    visit artists_path
    expect(page).to have_content "Bob Marley"
    expect(page).to have_content "Taylor Swift"

    click_on "Taylor Swift"
   
    expect(page).to have_content "Taylor Swift"
    expect(page).to have_css("img[src=\"https://upload.wikimedia.org/wikipedia/commons/b/b2/Taylor_Swift_Red_Tour_2%2C_2013.jpg\"]")

  end
end
