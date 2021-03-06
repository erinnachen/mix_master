require 'rails_helper'

RSpec.feature "User creates a playlist" do
  scenario "user can create a playlist and see song links" do
    song_one, song_two, song_three = create_list(:song, 3)

    visit playlists_path
    playlist_name = "capybara plays the hits"
    click_on "New playlist"

    fill_in "playlist_name", with: playlist_name
    check("song-#{song_one.id}")
    check("song-#{song_three.id}")
    click_on "Create Playlist"

    expect(page).to have_content playlist_name
    within ("li:first") do
      expect(page).to have_link song_one.title, href: song_path(song_one.id)
    end
    within ("li:last") do
      expect(page).to have_link song_three.title, href: song_path(song_three.id)
    end
  end
end
