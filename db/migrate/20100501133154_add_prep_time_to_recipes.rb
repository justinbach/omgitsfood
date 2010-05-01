class AddPrepTimeToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :prep_time, :string
  end

  def self.down
    remove_column :recipes, :prep_time
  end
end
