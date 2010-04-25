class Recipe < ActiveRecord::Base
  has_many :meals
  belongs_to :user
  validates_presence_of :title, :directions, :ingredients 
end
