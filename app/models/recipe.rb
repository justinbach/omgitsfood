class Recipe < ActiveRecord::Base
  has_many :meals
  has_many :ingredientships
  has_many :ingredients, :through => :ingredientships
  belongs_to :user
  
  validates_presence_of :title, :body
end
