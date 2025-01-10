require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Bookmark', type: :model do
  let(:user) { create(:user) }
  let(:list) { create(:list, user:) }
  let(:list2) { create(:list, user:, title: 'Breakfasts') }
  let(:recipe) { create(:recipe, user:) }
  let(:recipe2) { create(:recipe, user:, name: 'Strata') }
  let(:bookmark) { create(:bookmark, list:, recipe:) }

  let(:valid_attributes) do
    {
      comment: 'Great recipe!',
      recipe:,
      list:
    }
  end

  it 'responds to comment' do
    expect(bookmark.comment).to eq('For family parties')
  end

  it 'belongs to a recipe' do
    expect(bookmark.recipe).to eq(recipe)
  end

  it 'belongs to a list' do
    expect(bookmark.list).to eq(list)
  end

  it 'recipe cannot be blank' do
    attributes = valid_attributes
    attributes.delete(:recipe)
    bookmark = Bookmark.new(attributes)
    expect(bookmark).not_to be_valid
  end

  it 'list cannot be blank' do
    attributes = valid_attributes
    attributes.delete(:list)
    bookmark = Bookmark.new(attributes)
    expect(bookmark).not_to be_valid
  end

  it 'is unique for a given recipe/list couple' do
    expect(bookmark).to be_valid

    new_comment_bookmark = Bookmark.new(valid_attributes.merge(comment: 'Award-winning'))
    expect(new_comment_bookmark).not_to be_valid

    new_recipe_bookmark = Bookmark.new(valid_attributes.merge(recipe: recipe2))
    expect(new_recipe_bookmark).to be_valid

    new_list_bookmark = Bookmark.new(valid_attributes.merge(list: list2))
    expect(new_list_bookmark).to be_valid
  end
end
# rubocop:enable Metrics/BlockLength
