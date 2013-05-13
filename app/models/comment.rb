class Comment < ActiveRecord::Base
  belongs_to :task
  attr_accessible :title
end
