class Recipe < ActiveRecord::Base
  has_many :meals
  has_many :ingredientships
  has_many :ingredients, :through => :ingredientships
end
