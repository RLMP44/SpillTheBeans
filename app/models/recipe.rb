class Recipe < ApplicationRecord
  # self.table_name = 'rec_lis_recipes'
  belongs_to :user#, foreign_key: 'rec_lis_user_id'
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  has_many :ingredients
  has_many :bookmarks#, foreign_key: 'rec_lis_recipe_id'
  # validates :user, presence: true, foreign_key: 'rec_lis_user_id'
  scope :top_recipes, lambda { |recipe|
    recipe.order()
    where()
  }

  # def user_id
  #   rec_lis_user_id
  # end

  def get_username
    username
  end

  def self.get_top_recipes
    self.tally_bookmarks
  end

  private

  def username
    user.username
  end

  def self.tally_bookmarks
    hash = {}
    Recipe.all.each do |recipe|
      hash[recipe] = recipe.bookmarks.count
    end
    sorted_hash = hash.sort_by { |key, value| value }.to_h
    top_ten = sorted_hash.keys.last(10)
    top_ten
  end
end
