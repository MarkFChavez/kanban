class Task < ActiveRecord::Base
  
  VALID_STATUS = ["TODO", "DOING", "DONE"]

  belongs_to :project, counter_cache: :tasks_count
  attr_accessible :name, :status

  validates :name, presence: true
  validates :status, inclusion: {in: VALID_STATUS}

  scope :todo, where(status: "TODO")
  scope :doing, where(status: "DOING")
  scope :done, where(status: "DONE")

  def to_param
  	"#{id}-#{name.parameterize}"
  end
end
