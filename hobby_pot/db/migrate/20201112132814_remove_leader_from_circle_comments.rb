class RemoveLeaderFromCircleComments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :circle_comments, :leader, foreign_key: true, index: true
    remove_reference :circle_comments, :leaders, foreign_key: true, index: true
  end
end
