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
end
