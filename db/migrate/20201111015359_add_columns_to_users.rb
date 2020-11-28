class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :prefecture_id, :string
    add_column :users, :introduction, :text
    add_column :users, :user_image_id, :string
    add_column :users, :is_deleted, :boolean, default: false
  end
end
