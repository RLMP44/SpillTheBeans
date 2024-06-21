require "rails_helper"

RSpec.describe "Bookmark", type: :model do
  let(:rach) do
    User.create!(email: 'rach@me.com', password: '123456')
  end

  let(:titanic) do
    Recipe.create!(user: rach, name: "Titanic", description: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic, 84 years later.")
  end

  let(:wonder_woman) do
    Recipe.create!(user: rach, name: "Wonder Woman 1984", description: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s")
  end

  let(:classic_list) do
    List.create!(user: rach, title: "Classic recipes", comment: "classic")
  end

  let(:comedy_list) do
    List.create!(user: rach, title: "Comedy", comment: "hilariously bad")
  end

  let(:valid_attributes) do
    {
      comment: "Great recipe!",
      recipe: titanic,
      list: classic_list
    }
  end

  it "has a comment" do
    bookmark = Bookmark.new(comment: "Great recipe!")
    expect(bookmark.comment).to eq("Great recipe!")
  end

  it "comment cannot be shorter than 3 characters" do
    bookmark = Bookmark.new(comment: "ya", list: classic_list, recipe: titanic)
    expect(bookmark).not_to be_valid
  end

  it "belongs to a recipe" do
    bookmark = Bookmark.new(recipe: titanic)
    expect(bookmark.recipe).to eq(titanic)
  end

  it "belongs to a list" do
    bookmark = Bookmark.new(list: classic_list)
    expect(bookmark.list).to eq(classic_list)
  end

  it "recipe cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:recipe)
    bookmark = Bookmark.new(attributes)
    expect(bookmark).not_to be_valid
  end

  it "list cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:list)
    bookmark = Bookmark.new(attributes)
    expect(bookmark).not_to be_valid
  end

  it "is unique for a given recipe/list couple" do
    Bookmark.create!(valid_attributes)

    bookmark = Bookmark.new(valid_attributes.merge(comment: "Award-winning"))
    expect(bookmark).not_to be_valid

    bookmark = Bookmark.new(valid_attributes.merge(list: comedy_list))
    expect(bookmark).to be_valid

    bookmark = Bookmark.new(valid_attributes.merge(recipe: wonder_woman))
    expect(bookmark).to be_valid
  end
end
