class AddUserIdToMeals < ActiveRecord::Migration
  def self.up
    add_column :meals, :user_id, :integer
  end

  def self.down
    remove_column :meals, :user_id
  end
end
