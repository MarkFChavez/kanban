class Project < ActiveRecord::Base
  belongs_to :user, counter_cache: :projects_count
  attr_accessible :description, :title
end
