class Meal < ActiveRecord::Base
  has_one :recipe
end
