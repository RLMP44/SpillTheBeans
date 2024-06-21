require 'rails_helper'

RSpec.describe "List", type: :model do
  let(:rach) do
    User.create!(email: 'rach@me.com', password: '123456')
  end

  let(:valid_attributes) do
    {
      user: rach,
      title: "Comedy",
      comment: "wowza"
    }
  end

  let(:titanic) do
    Recipe.create!(title: "Titanic", description: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic, 84 years later.")
  end

  it "has a title" do
    list = List.new(user: rach, title: "Comedy", comment: "wowowow")
    expect(list.title).to eq("Comedy")
  end

  it "title cannot be blank" do
    list = List.new
    expect(list).not_to be_valid
  end

  it "title is unique" do
    List.create!(user: rach, title: "Comedy", comment: "wowowow")
    list = List.new(user: rach, title: "Comedy", comment: "wowowow")
    expect(list).not_to be_valid
  end

  it "belongs to a user" do
    list = List.new(user: rach, title: "Comedy", comment: "wowowow")
    expect(list.user).to eq(rach)
  end

  it "has many bookmarks" do
    list = List.new(valid_attributes)
    expect(list).to respond_to(:bookmarks)
    expect(list.bookmarks.count).to eq(0)
  end

  it "has many recipes" do
    list = List.create!(valid_attributes)
    expect(list).to respond_to(:recipes)
    expect(list.recipes.count).to eq(0)

    list.bookmarks.create(list: list, recipe: titanic, comment: "Great recipe!")
    expect(list.recipes.count).to eq(1)
  end

  it "should destroy child saved recipes when destroying self" do
    list = List.create!(valid_attributes)
    list.bookmarks.create(list: list, recipe: titanic, comment: "Great recipe!")
    expect { list.destroy }.to change { Bookmark.count }.from(1).to(0)
  end
end
