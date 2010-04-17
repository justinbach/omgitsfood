class Recipe < ActiveRecord::Base
  has_many :ingredientships
  has_many :ingredients, :through => :ingredientships
end
