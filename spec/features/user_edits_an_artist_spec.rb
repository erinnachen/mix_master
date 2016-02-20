require 'rails_helper'

RSpec.feature "user can edit an existing artist" do
  def taylor
    ({name: "Taylor Swift", image_path: "https://upload.wikimedia.org/wikipedia/commons/b/b2/Taylor_Swift_Red_Tour_2%2C_2013.jpg"})
  end

  def marley
    ({name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"})
  end

  scenario "they update an existing artist name but should see the old image" do
    tay = Artist.create(taylor)
    bob = Artist.create(marley)

    visit artist_path(tay.id)
    click_on "Edit"
    fill_in "artist_name", with: "Just Taylor"
    click_on "Update Artist"

    expect(page).to have_content "Just Taylor"
    expect(page).to have_css("img[src=\"https://upload.wikimedia.org/wikipedia/commons/b/b2/Taylor_Swift_Red_Tour_2%2C_2013.jpg\"]")
  end
end
