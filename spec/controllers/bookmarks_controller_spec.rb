require 'rails_helper'
begin
  require "bookmarks_controller"
rescue LoadError
end

if defined?(BookmarksController)
  # rubocop:disable Metrics/BlockLength
  RSpec.describe BookmarksController, type: :controller do
    let(:user) { create(:user) }
    let(:recipe) { create(:recipe, user:) }
    let(:list) { create(:list, user:) }

    before do
      sign_in user
    end

    let(:valid_attributes) do
      { list_id: list.id, bookmark: { recipe_id: recipe.id, comment: "Great recipe" } }
    end

    # let(:invalid_attributes) do
    #   { list_id: list.id, bookmark: { recipe_id: recipe.id, comment: "Ah" } }
    # end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new bookmark" do
          expect do
            post :create, params: valid_attributes
          end.to change(Bookmark, :count).by(1)
        end

        it "assigns a newly created bookmark as a bookmark" do
          post :create, params: valid_attributes
          expect(assigns(:bookmark)).to be_a(Bookmark)
          expect(assigns(:bookmark)).to be_persisted
        end

        it "redirects to the created list" do
          post :create, params: valid_attributes
          expect(response).to redirect_to(list)
        end
      end

      # describe "with invalid params" do
      #   it "does not create or save a new bookmark" do
      #     post :create, params: invalid_attributes
      #     expect(assigns(:bookmark)).to be_a_new(Bookmark)
      #   end

      #   it "re-renders the 'new' template or 'lists/show'" do
      #     post :create, params: invalid_attributes
      #     expect(response).to have_http_status(:unprocessable_entity)
      #   end
      # end
    end

    describe "DELETE destroy" do
      it "deletes a bookmark" do
        bookmark = Bookmark.create!(valid_attributes[:bookmark].merge(list_id: list.id))
        expect do
          delete :destroy, params: { id: bookmark.id }
        end.to change(Bookmark, :count).by(-1)
      end
    end
  end
else
  describe "BookmarksController" do
    it "should exist" do
      expect(defined?(Bookmarks)).to eq(true)
    end
  end
  # rubocop:enable Metrics/BlockLength
end
