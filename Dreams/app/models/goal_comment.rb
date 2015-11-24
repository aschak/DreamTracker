class GoalComment < ActiveRecord::Base
  validates :body, :goal_id, :author_id, presence: true

  belongs_to :goal

  belongs_to :author,
    foreign_key: :author_id,
    class_name: 'User'

  has_one :user,
    through: :goal,
    source: :user

end
