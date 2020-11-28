class RenameDateAndTimeColumnToCircles < ActiveRecord::Migration[5.2]
  def change
    rename_column :circles, :date_and_time, :start_time
  end
end
