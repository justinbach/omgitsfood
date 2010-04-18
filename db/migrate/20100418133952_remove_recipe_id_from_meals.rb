class RemoveRecipeIdFromMeals < ActiveRecord::Migration
  def self.up
    remove_column :meals, :recipe_id
  end

  def self.down
    add_column :meals, :recipe_id, :integer
  end
end
