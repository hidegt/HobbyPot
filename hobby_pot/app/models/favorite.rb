class Favorite < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :circle
  belongs_to :leader, optional: true
  validates :user_id, uniqueness: {scope: :circle_id}
  validates :leader_id, uniqueness: {scope: :circle_id}
end
