class Ingredient < ActiveRecord::Base
  has_many :ingredientships
  has_many :recipes, :through => :ingredientships
end
