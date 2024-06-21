require 'rails_helper'

RSpec.describe "recipe", type: :model do
  let(:rach) do
    User.create!(email: 'rach@me.com', password: '123456')
  end

  let(:valid_attributes) do
    {
      name: "Titanic",
      description: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic, 84 years later.",
      # poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
      rating: 7.9
    }
  end

  it "has a name and an description" do
    recipe = Recipe.new(name: "Titanic", description: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic, 84 years later.")
    expect(recipe.name).to eq("Titanic")
    expect(recipe.description).to eq("101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic, 84 years later.")
  end

  it "name is unique" do
    Recipe.create!(name: "Titanic", description: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic, 84 years later.")
    recipe = Recipe.new(name: "Titanic")
    expect(recipe).not_to be_valid
  end

  it "name cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:name)
    recipe = Recipe.new(attributes)
    expect(recipe).not_to be_valid
  end

  it "description cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:description)
    recipe = Recipe.new(attributes)
    expect(recipe).not_to be_valid
  end

  it "belongs to a user" do
    recipe = Recipe.new(user: rach, name: "Food", comment: "wowowow")
    expect(recipe.user).to eq(rach)
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
