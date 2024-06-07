class Bookmark < ApplicationRecord
  # self.table_name = 'rec_lis_bookmarks'
  belongs_to :recipe#, foreign_key: 'rec_lis_recipe_id'
  belongs_to :list#, foreign_key: 'rec_lis_list_id'
  # validates :rec_lis_recipe_id, uniqueness: { scope: :list }#, foreign_key: 'rec_lis_list_id' }
  validates :recipe_id, uniqueness: { scope: :list }
  validates :comment, length: { minimum: 3 }

  # def recipe_id
  #   rec_lis_recipe_id
  # end
end
