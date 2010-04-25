class AddIngredientsToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :ingredients, :text
  end

  def self.down
    remove_column :recipes, :ingredients
  end
end
