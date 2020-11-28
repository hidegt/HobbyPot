class Favorite < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :circle
  validates :user_id, uniqueness: {scope: :circle_id}
end
