class ChangeDataImageIdToCircles < ActiveRecord::Migration[5.2]
  def change
    change_column :circles, :image_id, :string
  end
end
