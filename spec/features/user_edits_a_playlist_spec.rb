require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "user edits a playlist by swapping songs" do
    song_one, song_two, song_three = create_list(:song, 3)
    playlist = Playlist.create(name: "Winter Wonderland", songs: [song_one, song_three])

    new_list_name = "Replacement list name"
    visit playlist_path(playlist.id)
    click_on "Edit"
    fill_in "playlist_name", with: new_list_name
    check("song-#{song_two.id}")
    uncheck("song-#{song_three.id}")
    click_on "Update Playlist"

    expect(page).to have_content new_list_name
    within ("ul") do
      expect(page).to have_link song_one.title, href: song_path(song_one.id)
      expect(page).to have_link song_two.title, href: song_path(song_two.id)
      expect(page).not_to have_link song_three.title, href: song_path(song_three.id)
    end

  end

end
