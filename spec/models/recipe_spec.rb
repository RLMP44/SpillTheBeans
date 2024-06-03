require 'rails_helper'

RSpec.describe "recipe", type: :model do
  let(:valid_attributes) do
    {
      title: "Titanic",
      overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic, 84 years later.",
      poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
      rating: 7.9
    }
  end

  it "has a title and an overview" do
    recipe = Recipe.new(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic, 84 years later.")
    expect(recipe.title).to eq("Titanic")
    expect(recipe.overview).to eq("101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic, 84 years later.")
  end

  it "title is unique" do
    Recipe.create!(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic, 84 years later.")
    recipe = Recipe.new(title: "Titanic")
    expect(recipe).not_to be_valid
  end

  it "title cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:title)
    recipe = Recipe.new(attributes)
    expect(recipe).not_to be_valid
  end

  it "overview cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:overview)
    recipe = Recipe.new(attributes)
    expect(recipe).not_to be_valid
  end

  it "has many bookmarks" do
    recipe = Recipe.new(valid_attributes)
    expect(recipe).to respond_to(:bookmarks)
    expect(recipe.bookmarks.count).to eq(0)
  end

  it "should not be able to destroy self if has bookmarks children" do
    recipe = Recipe.create!(valid_attributes)
    list = List.create!(name: "Drama")
    recipe.bookmarks.create(list: list, comment: "Great recipe!")

    expect { recipe.destroy }.to raise_error(ActiveRecord::InvalidForeignKey)
  end
end
