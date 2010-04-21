class Recipe < ActiveRecord::Base
  has_many :meals
  has_many :ingredientships
  has_many :ingredients, :through => :ingredientships
  belongs_to :user
end
