require 'rails_helper'

RSpec.describe PlaylistsController, type: :controller do
  describe "GET #new" do
    it "assigns the builds and empty playlist as @playlist and renders the new template" do
      get :new
      expect(assigns(:playlist)).to be_a(Playlist)
      expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do
    it "assigns the requested playlist as @playlist and renders the edit template" do
      playlist = create(:playlist)
      get(:edit, params: {:id => playlist.id})
      expect(assigns(:playlist)).to eq(playlist)
      expect(response).to render_template("edit")
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new playlist" do
        expect {
          post :create, {:playlist => attributes_for(:playlist)}
        }.to change(Playlist, :count).by(1)
      end

      it "assigns a newly created playlist as @playlist" do
        post :create, {:playlist => attributes_for(:playlist)}
        expect(assigns(:playlist)).to be_a(Playlist)
        expect(assigns(:playlist)).to be_persisted
      end

      it "redirects to the created playlist" do
        post :create, {:playlist => attributes_for(:playlist)}
        expect(response).to redirect_to(Playlist.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved playlist as @playlist" do
        post :create, {:playlist => attributes_for(:playlist, name: nil)}
        expect(assigns(:playlist)).to be_a_new(Playlist)
      end

      it "re-renders the 'new' template" do
        post :create, {:playlist => attributes_for(:playlist, name: nil)}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the correct playlist" do
        playlist = create(:playlist)
        put :update, {:id => playlist.id, :playlist => attributes_for(:playlist, name: "Toby")}
        playlist.reload

        expect(playlist.name).to eq("Toby")
      end

      it "assigns the correct playlist as @playlist" do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: "Mark")}

        expect(assigns(:playlist)).to eq(playlist)
      end

      it "redirects to the playlist show page" do
        playlist = create(:playlist)
        put :update, {:id => playlist.id, :playlist => attributes_for(:playlist, name: "Will")}

        expect(response).to redirect_to(playlist)
      end
    end

    context "with invalid params" do
      it "assigns the playlist as @playlist" do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: nil)}
        expect(assigns(:playlist)).to eq(playlist)
      end

      it "re-renders the 'edit' template" do
        playlist = create(:playlist)
        put :update, {:id => playlist.to_param, :playlist => attributes_for(:playlist, name: nil)}
        expect(response).to render_template("edit")
      end
    end
  end
end
