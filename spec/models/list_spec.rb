require 'rails_helper'

RSpec.describe "List", type: :model do
  let(:rach) do
    User.create!(email: 'rach@me.com', password: '123456')
  end

  let(:valid_attributes) do
    {
      user: rach,
      title: "Breakfast",
      comment: "wowza"
    }
  end

  let(:strata) do
    Recipe.create!(user: rach,
                   name: "strata",
                   description: "Baked egg casserole.")
  end

  it "has a title" do
    list = List.new(user: rach, title: "Breakfast", comment: "wowowow")
    expect(list.title).to eq("Breakfast")
  end

  it "title cannot be blank" do
    list = List.new
    expect(list).not_to be_valid
  end

  it "title is unique" do
    List.create!(user: rach, title: "Breakfast", comment: "wowowow")
    list = List.new(user: rach, title: "Breakfast", comment: "wowowow")
    expect(list).not_to be_valid
  end

  it "belongs to a user" do
    list = List.new(user: rach, title: "Breakfast", comment: "wowowow")
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

    list.bookmarks.create(list:, recipe: strata, comment: "Great recipe!")
    expect(list.recipes.count).to eq(1)
  end

  it "should destroy child saved bookmarks when destroying self" do
    list = List.create!(valid_attributes)
    list.bookmarks.create(list:, recipe: strata, comment: "Great recipe!")
    expect { list.destroy }.to change { Bookmark.count }.from(1).to(0)
  end
end
