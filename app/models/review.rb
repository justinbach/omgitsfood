class Review < ActiveRecord::Base
  belongs_to :meal
  validates_presence_of :body
end
