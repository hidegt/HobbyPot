class CreateJoinCircles < ActiveRecord::Migration[5.2]
  def change
    create_table :join_circles do |t|
      t.integer :user_id
      t.integer :circle_id
      t.integer :join_status, null: false, default: 0

      t.timestamps
    end
  end
end
