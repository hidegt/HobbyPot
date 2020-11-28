class RemoveJoinStatusFromJoinCircles < ActiveRecord::Migration[5.2]
  def change
    remove_column :join_circles, :join_status, :integer
  end
end
