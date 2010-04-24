class FixRecipeMealRelationship < ActiveRecord::Migration
  def self.up
    add_column :meals, :recipe_id, :integer
    remove_column :recipes, :meal_id
  end

  def self.down
    remove_column :meals, :recipe_id
    add_column :recipes, :meal_id, :integer
  end
end
