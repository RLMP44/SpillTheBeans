require 'rails_helper'

RSpec.describe "recipe", type: :model do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user:) }
  let(:list) { create(:list, user:) }

  let(:valid_attributes) do
    {
      user:,
      name: "Strata",
      description: "Baked egg casserole",
      rating: 7.9
    }
  end

  it "has a name and a description" do
    expect(recipe.name).to eq("Pesto bowl")
    expect(recipe.description).to eq("Pesto and chicken and rice.")
  end

  it "name cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:name)
    invalid_recipe = Recipe.new(attributes)
    expect(invalid_recipe).not_to be_valid
  end

  it "description cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:description)
    invalid_recipe = Recipe.new(attributes)
    expect(invalid_recipe).not_to be_valid
  end

  it "belongs to a user" do
    expect(recipe.user).to eq(user)
  end

  it "has many bookmarks" do
    expect(recipe).to respond_to(:bookmarks)
    expect(recipe.bookmarks.count).to eq(0)
  end

  it 'has a rating' do
    expect(recipe).to respond_to(:rating)
  end

  it "should not be able to destroy self if has bookmarks children" do
    recipe.bookmarks.create(list:, comment: "Great recipe!")

    expect { recipe.destroy }.to raise_error(ActiveRecord::InvalidForeignKey)
  end
end
