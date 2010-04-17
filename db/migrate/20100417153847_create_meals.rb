class CreateMeals < ActiveRecord::Migration
  def self.up
    create_table :meals do |t|
      t.date :day

      t.timestamps
    end
  end

  def self.down
    drop_table :meals
  end
end
