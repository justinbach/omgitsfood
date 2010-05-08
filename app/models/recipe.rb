class Recipe < ActiveRecord::Base
  require 'json'
  
  has_many :meals
  belongs_to :user
  belongs_to :original_recipe, :class_name => 'Recipe'
  validates_presence_of :title, :directions, :ingredients 
  
  def to_json
    result = Hash.new
    self.class.content_columns.each do |column|
        result[column.name.to_sym] = self.send(column.name)
    end
    result.to_json
  end
end
