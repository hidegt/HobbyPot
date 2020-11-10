class ChangeIsDeleatedOfUsers < ActiveRecord::Migration[5.2]
  def change
    def up
    change_column :users, :is_deleted, :boolean, default: 'false'
    end
  
    def down
      change_column :users, :status, :string
    end
  end
end
