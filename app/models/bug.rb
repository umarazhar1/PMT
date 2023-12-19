class Bug < ApplicationRecord

  has_many :bug_projects
  has_many :projects, through: :bug_projects

  validates :title, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :title

  validates :title, :status, :bug_type, presence: true

  enum bug_type: {
    bug: 0,
    feature: 1
  }


  enum status: {
    new_bug: 0,
    started: 1,
    resolved: 2,
    completed: 3
  }

end