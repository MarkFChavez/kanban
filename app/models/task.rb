class Task < ActiveRecord::Base
  belongs_to :project, counter_cache: :tasks_count
  attr_accessible :name, :status
end
