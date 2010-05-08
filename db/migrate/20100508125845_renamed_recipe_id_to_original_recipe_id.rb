class RenamedRecipeIdToOriginalRecipeId < ActiveRecord::Migration
  def self.up
    rename_column :recipes, :recipe_id, :original_recipe_id
  end

  def self.down
    rename_column :recipes, :original_recipe_id,  :recipe_id
  end
end
