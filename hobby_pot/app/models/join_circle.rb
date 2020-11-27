class JoinCircle < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :circle, optional: true
  validates :user_id, uniqueness: {scope: :circle_id}
end
