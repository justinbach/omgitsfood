class AddYieldToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :yield, :string
  end

  def self.down
    remove_column :recipes, :yield
  end
end
