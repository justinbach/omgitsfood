class Meal < ActiveRecord::Base
  has_one :recipe
  belongs_to :user
  accepts_nested_attributes_for :recipe
end
