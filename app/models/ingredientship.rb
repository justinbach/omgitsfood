class Ingredientship < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredients
end
