class Project < ApplicationRecord
    belongs_to :user
    
    has_many :bug_projects
    has_many :bugs, through: :bug_projects

    validates :title, presence: true, length: {minimum: 3, maximum: 30}
    validates :description, presence: true, length: {minimum: 5, maximum: 400}
end
  