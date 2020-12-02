class AddScoreToCircleComments < ActiveRecord::Migration[5.2]
  def change
    add_column :circle_comments, :score_comment, :decimal, precision: 5, scale: 3
  end
end
