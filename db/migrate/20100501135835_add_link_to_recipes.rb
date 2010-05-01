class AddLinkToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :link, :string
  end

  def self.down
    remove_column :recipes, :link
  end
end
