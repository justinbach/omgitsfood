class AddMealIdToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :meal_id, :integer
  end

  def self.down
    remove_column :recipes, :meal_id
  end
end
