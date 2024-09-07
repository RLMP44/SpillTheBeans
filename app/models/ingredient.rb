class Ingredient < ApplicationRecord
  belongs_to :recipe
  validates :recipe_id, presence: true
  validates :amount, presence: true
  validates :name, presence: true
  validates :name, length: { minimum: 3 }
end
