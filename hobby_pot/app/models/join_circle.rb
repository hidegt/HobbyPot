class JoinCircle < ApplicationRecord
  attachment :image
  enum join_status: {"参加":0, "キャンセル":1, "未参加":2}
  belongs_to :user, optional: true
  belongs_to :circle, optional: true
end
