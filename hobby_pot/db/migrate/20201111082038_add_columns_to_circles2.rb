class AddColumnsToCircles2 < ActiveRecord::Migration[5.2]
  def change
    add_column :circles, :postcode, :string
    add_column :circles, :prefecture_code, :string
    add_column :circles, :address_city, :string
    add_column :circles, :address_street, :string
    add_column :circles, :address_building, :string
  end
end
