class RemoveIngredients < ActiveRecord::Migration
  def self.up
    drop_table :ingredientships
    drop_table :ingredients
  end

  def self.down
    create_table :ingredients do |t|
      t.string :name

      t.timestamps
    end
    create_table :ingredientships do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.string :quantity
      t.datetime :created_at

      t.timestamps
    end
  end
end
