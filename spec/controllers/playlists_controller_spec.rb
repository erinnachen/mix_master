require 'rails_helper'

RSpec.describe PlaylistsController, type: :controller do
  describe "POST #create" do
    context "with valid params" do
      it "creates a new playlist" do
        expect {
          post :create, {:playlist => attributes_for(:playlist)}
        }.to change(Playlist, :count).by(1)
      end

      it "assigns the new playlist to @playlist" do
        post :create, {:playlist => attributes_for(:playlist)}
        expect(assigns(:playlist)).to be_a(Playlist)
        expect(assigns(:playlist)).to be_persisted
      end

      it "redirects to the show playlist path" do
        post :create, {:playlist => attributes_for(:playlist)}
        expect(response).to redirect_to playlist_path(Playlist.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved playlist as @playlist" do
        expect {
        post :create, {:playlist => attributes_for(:playlist, name: nil)}
      }.not_to change(Playlist, :count)
        expect(assigns(:playlist)).to be_a_new(Playlist)
      end

      it "re-renders the template new" do
        post :create, {:playlist => attributes_for(:playlist, name: nil)}
        expect(response).to render_template "new"
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates an existing playlist" do
        playlist = create(:playlist)
        expect {
          put :update, {id: playlist.to_param, playlist: attributes_for(:playlist, name: "Jamming to new music")}
        }.not_to change(Playlist, :count)
        playlist.reload
        expect(playlist.name).to eq("Jamming to new music")
      end

      it "assigns the updated playlist to @playlist" do
        playlist = create(:playlist)
        put :update, {id: playlist.to_param, playlist: attributes_for(:playlist, name: "Jamming to new music")}
        playlist.reload

        expect(assigns(:playlist)).to eq(playlist)
      end

      it "redirects to the playlist show path" do
        playlist = create(:playlist)
        put :update, {id: playlist.to_param, playlist: attributes_for(:playlist, name: "Jamming to new music")}
        playlist.reload

        expect(response).to redirect_to playlist
      end
    end

    context "with invalid params" do
      it "assigns the requested playlist to @playlist" do
        playlist = create(:playlist)
        expect {
          put :update, {id: playlist.to_param, playlist: attributes_for(:playlist, name: nil)}
        }.not_to change(Playlist, :count)
        expect(assigns :playlist).to eq(playlist)
      end

      it "re-renders the edit template" do
        playlist = create(:playlist)
        put :update, {id: playlist.to_param, playlist: attributes_for(:playlist, name: nil)}
        expect(response).to render_template "edit"
      end
    end
  end
end
