class Following < ActiveRecord::Base
  belongs_to :user
  belongs_to :followee, :class_name => "User", :foreign_key => "followee_id"
end
