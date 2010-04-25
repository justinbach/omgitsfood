class RenameBodyToDirections < ActiveRecord::Migration
  def self.up
    rename_column :recipes, :body, :directions
  end

  def self.down
    rename_column :recipes, :directions, :body
  end
end
