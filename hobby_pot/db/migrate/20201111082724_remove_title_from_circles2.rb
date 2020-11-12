class RemoveTitleFromCircles2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :circles, :address, :string
  end
end
