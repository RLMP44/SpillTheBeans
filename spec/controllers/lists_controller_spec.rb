require 'rails_helper'
begin
  require "./spec/controllers/bookmarks_controller"
rescue LoadError
end

if defined?(ListsController)
  RSpec.describe ListsController, type: :controller do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    let(:valid_attributes) do
      { user:, title: "Dinner", comment: "coolio" }
    end

    let(:invalid_attributes) do
      { user:, title: "" }
    end

    describe "GET index" do
      it "assigns all lists as @lists" do
        list = List.create! valid_attributes
        get :index, params: {}
        expect(assigns(:lists)).to eq([list])
      end
    end

    describe "GET show" do
      it "assigns the requested list as @list" do
        list = List.create! valid_attributes
        get :show, params: { id: list.to_param }
        expect(assigns(:list)).to eq(list)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new List" do
          expect do
            post :create, params: { list: valid_attributes }
          end.to change(List, :count).by(1)
        end

        it "assigns a newly created list as @list" do
          post :create, params: { list: valid_attributes }
          expect(assigns(:list)).to be_a(List)
          expect(assigns(:list)).to be_persisted
        end

        it "redirects to the created list" do
          post :create, params: { list: valid_attributes }
          expect(response).to redirect_to(List.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved list as @list" do
          post :create, params: { list: invalid_attributes }
          expect(assigns(:list)).to be_a_new(List)
        end
      end
    end
    describe "DELETE destroy" do
      let!(:recipe) { create(:recipe, user: user) }
      let!(:list) { create(:list, user: user) }

      context "when deleting a list" do
        it "deletes the list" do
          expect {
            delete :destroy, params: { id: list.id }
          }.to change(List, :count).by(-1)
        end

        it "destroys associated bookmarks" do
          list.bookmarks.create!(recipe: recipe, comment: "Great recipe!")
          expect {
            delete :destroy, params: { id: list.id }
          }.to change(Bookmark, :count).by(-1)
        end
      end
    end
  end

else
  describe "ListsController" do
    it "should exist" do
      expect(defined?(ListsController)).to eq(true)
    end
  end
end
