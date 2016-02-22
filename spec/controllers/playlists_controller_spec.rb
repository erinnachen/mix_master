require 'rails_helper'

RSpec.describe PlaylistsController, type: :controller do
  describe "POST #create" do
    context "create with valid params" do
      it "creates a new playlist" do
        playlist = create(:playlist)
        expect {
          post :create, {:playlist => attributes_for(:playlist)}
        }.to change(Playlist, :count).by(1)
      end

      it "assigns the new playlist to @playlist" do
        playlist = create(:playlist)
        post :create, {:playlist => attributes_for(:playlist)}
        expect(assigns(:playlist)).to be_a(Playlist)
        expect(assigns(:playlist)).to be_persisted
      end

      it "redirects to the show playlist path" do
        playlist = create(:playlist)
        post :create, {:playlist => attributes_for(:playlist)}
        expect(response).to redirect_to playlist_path(Playlist.last)
      end
    end
  end
end
