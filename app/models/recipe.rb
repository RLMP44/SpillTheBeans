class Recipe < ApplicationRecord
  self.table_name = 'rec_lis_recipes'
  belongs_to :user, foreign_key: 'rec_lis_user_id'
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  has_many :bookmarks, foreign_key: 'rec_lis_recipe_id'
  # validates :user, presence: true, foreign_key: 'rec_lis_user_id'
end
