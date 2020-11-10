class ChangeIsDeleatedOfLeaders < ActiveRecord::Migration[5.2]
  def change
    def up
    change_column :leaders, :is_deleted, :boolean, default: 'false'
    end
  
    def down
      change_column :projects, :status, :string
    end
  end
end
