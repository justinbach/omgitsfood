class Meal < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user
  accepts_nested_attributes_for :recipe
  has_one :review
end
