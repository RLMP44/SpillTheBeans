class AddDetailsToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :cook_time, :integer
    add_column :recipes, :difficulty, :float
    add_column :recipes, :oven, :boolean
    add_column :recipes, :total_time, :integer
    add_column :recipes, :oven_temp, :integer
    add_column :recipes, :ingredients, :string
    add_column :recipes, :instructions, :string
  end
end
