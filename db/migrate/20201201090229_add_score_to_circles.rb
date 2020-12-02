class AddScoreToCircles < ActiveRecord::Migration[5.2]
  def change
    add_column :circles, :score_title, :decimal, precision: 5, scale: 3
    add_column :circles, :score_about, :decimal, precision: 5, scale: 3
    add_column :circles, :score_schedule, :decimal, precision: 5, scale: 3
    add_column :circles, :score_prepare, :decimal, precision: 5, scale: 3
  end
end
