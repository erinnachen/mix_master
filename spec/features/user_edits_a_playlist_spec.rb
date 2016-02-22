require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "user edits a playlist by swapping songs" do

    playlist = create(:playlist_with_songs)
    song_one, song_two, song_three = playlist.songs
    song_four = create(:song)

    new_list_name = "Replacement list name"
    visit playlist_path(playlist.id)

    click_on "Edit"
    save_and_open_page
    fill_in "playlist_name", with: new_list_name
    check("song-#{song_four.id}")
    uncheck("song-#{song_three.id}")
    click_on "Update Playlist"

    expect(page).to have_content new_list_name
    within ("ul") do
      expect(page).to have_link song_four.title, href: song_path(song_four.id)
      expect(page).not_to have_link song_three.title, href: song_path(song_three.id)
    end

  end

end
