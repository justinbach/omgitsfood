class AddRecipeIdToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :recipe_id, :integer
  end

  def self.down
    remove_column :recipes, :recipe_id
  end
end
