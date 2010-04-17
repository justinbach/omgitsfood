class Meal < ActiveRecord::Base
  has_one :recipe
  accepts_nested_attributes_for :recipe
end
