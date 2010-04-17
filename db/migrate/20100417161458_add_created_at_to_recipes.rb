class AddCreatedAtToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :created_at, :datetime
  end

  def self.down
    remove_column :recipes, :created_at
  end
end
