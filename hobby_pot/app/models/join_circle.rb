class JoinCircle < ApplicationRecord
  enum join_status: {"参加":0, "キャンセル":1, "未参加":2}
  belongs_to :user
  belongs_to :circle
end
