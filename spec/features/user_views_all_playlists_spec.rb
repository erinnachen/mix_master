require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "User can see all playlists" do
    pl_one, pl_two, pl_three = create_list(:playlist, 3)
    
    visit playlists_path
    expect(page).to have_content pl_two.name

    within ("li:first") do
      expect(page).to have_link pl_one.name, href: playlist_path(pl_one.id)
    end
    within ("li:last") do
      expect(page).to have_link pl_three.name, href: playlist_path(pl_three.id)
    end
  end
end
