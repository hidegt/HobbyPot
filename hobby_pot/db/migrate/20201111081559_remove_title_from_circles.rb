class RemoveTitleFromCircles < ActiveRecord::Migration[5.2]
  def change
    remove_column :circles, :prefecture_id, :string
  end
end
