class AddColumnsToCircles < ActiveRecord::Migration[5.2]
  def change
    add_column :circles, :prefecture_id, :string
    add_column :circles, :address, :string
    
  end
end
