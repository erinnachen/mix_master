require 'rails_helper'

RSpec.feature "User can delete an artist" do
  def taylor
    ({name: "Taylor Swift", image_path: "https://upload.wikimedia.org/wikipedia/commons/b/b2/Taylor_Swift_Red_Tour_2%2C_2013.jpg"})
  end

  scenario "delete an artist and that artist can no longer be found in the index" do
    tay = Artist.create(taylor)

    visit artists_path
    expect(page).to have_content "Taylor Swift"

    click_on "Delete"

    expect(page.current_path).to eq (artists_path)
    expect(page).not_to have_content "Taylor Swift"
  end
end
