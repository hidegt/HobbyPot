class CreateCircleComments < ActiveRecord::Migration[5.2]
  def change
    create_table :circle_comments do |t|
      t.text :comment
      t.references :user, foreign_key: true
      t.references :circle, foreign_key: true
      t.references :leader, foreign_key: true

      t.timestamps
    end
  end
end
