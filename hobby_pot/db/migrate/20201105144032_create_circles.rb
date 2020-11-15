class CreateCircles < ActiveRecord::Migration[5.2]
  def change
    create_table :circles do |t|
      t.integer :leader_id, null: false
      t.string :circle_title, null: false
      t.string :image_id, null: false
      t.text :circle_about, null: false
      t.datetime :date_and_time, null: false
      t.text :schedule, null: false
      t.text :prepare, null: false
      t.string :join_cost, null: false
      t.string :number_people, null: false
      t.boolean :circle_status, null: false, default: true

      t.timestamps
    end
  end
end
