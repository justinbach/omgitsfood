class AddRecipeToMeal < ActiveRecord::Migration
  def self.up
    add_column :meals, :recipe_id, :integer
  end

  def self.down
    remove_column :meals, :recipe_id
  end
end
