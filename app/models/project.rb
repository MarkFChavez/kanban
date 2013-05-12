class Project < ActiveRecord::Base
  belongs_to :user, counter_cache: :projects_count
  has_many :tasks, dependent: :destroy
  attr_accessible :description, :title

  validates :title, presence: true

  scope :recent, order('created_at DESC').limit(3)

  def to_param
  	"#{id}-#{title.parameterize}"
  end
end
