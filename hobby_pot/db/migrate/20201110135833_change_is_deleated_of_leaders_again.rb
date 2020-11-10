class ChangeIsDeleatedOfLeadersAgain < ActiveRecord::Migration[5.2]
  def change
    def up
    change_column :leaders, :is_deleted, :boolean, default: 'false'
    end
    def down
      change_column :leaders, :is_deleted, :boolean
    end
  end
end
