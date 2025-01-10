require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'List', type: :model do
  let(:user) { create(:user) }
  let(:user2) { create(:user, email: '12@me.com', password: '123456', username: 'user2') }
  let(:list) { create(:list, user:) }
  let(:recipe) { create(:recipe, user:) }

  it 'has a title' do
    expect(list.title).to eq('Dinner')
  end

  it 'title cannot be blank' do
    untitled_list = List.new
    expect(untitled_list).not_to be_valid
  end

  it 'title is unique when same user' do
    list
    dup_list = List.new(user:, title: 'Dinner')
    expect(dup_list).not_to be_valid
  end

  it 'title can be used by other users' do
    user2_list = List.new(user: user2, title: 'Dinner')
    expect(user2_list).to be_valid
  end

  it 'belongs to a user' do
    expect(list.user).to eq(user)
  end

  it 'has many bookmarks' do
    Bookmark.create!(list:, recipe:)
    expect(list).to respond_to(:bookmarks)
    expect(list.bookmarks.count).to eq(1)
  end

  it 'has many recipes' do
    expect(list).to respond_to(:recipes)
    expect(list.recipes.count).to eq(0)

    list.bookmarks.create(list:, recipe:, comment: 'Great recipe!')
    expect(list.recipes.count).to eq(1)
  end

  it 'should destroy child saved bookmarks when destroying self' do
    list.bookmarks.create(list:, recipe:, comment: 'Great recipe!')
    expect { list.destroy }.to change { Bookmark.count }.from(1).to(0)
  end
end
# rubocop:enable Metrics/BlockLength
