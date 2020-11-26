class CircleComment < ApplicationRecord
  belongs_to :user
  belongs_to :circle
  validates :comment, presence: true, length: { maximum: 300 }
end
