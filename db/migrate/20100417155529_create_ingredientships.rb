class CreateIngredientships < ActiveRecord::Migration
  def self.up
    create_table :ingredientships do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.string :quantity
      t.datetime :created_at

      t.timestamps
    end
  end

  def self.down
    drop_table :ingredientships
  end
end
