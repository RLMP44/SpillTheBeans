class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.string :amount
      t.string :name

      t.timestamps
    end
  end
end
