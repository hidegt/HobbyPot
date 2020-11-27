class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      # 通知を送るユーザーid
      t.integer :visitor_id, null: false
      # 通知を受け取るユーザーid
      t.integer :visited_id, null: false
      # いいね
      t.integer :circle_id
      # 参加
      t.integer :join_circle_id
      # 通知の種類
      t.string :action, default: '', null: false
      # 通知確認
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
      add_index :notifications, :visitor_id
      add_index :notifications, :visited_id
      add_index :notifications, :circle_id
      add_index :notifications, :join_circle_id
  end
end
