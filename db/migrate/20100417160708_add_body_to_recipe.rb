class AddBodyToRecipe < ActiveRecord::Migration
  def self.up
    add_column :recipes, :body, :text
  end

  def self.down
    remove_column :recipes, :body
  end
end
