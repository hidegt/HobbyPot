class AddColumnsToLeaders < ActiveRecord::Migration[5.2]
  def change
    add_column :leaders, :prefecture_id, :string
    add_column :leaders, :introduction, :text
    add_column :leaders, :leader_image_id, :string
    add_column :leaders, :is_deleted, :boolean
  end
end
