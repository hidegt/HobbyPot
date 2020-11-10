class ChangeIsDeleatedOfUsersAgain < ActiveRecord::Migration[5.2]
  def change
    def up
    change_column :users, :is_deleted, :boolean, default: 'false'
    end
    def down
      change_column :users, :is_deleted, :boolean
    end
  end
end
