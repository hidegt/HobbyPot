class ChangeAdminsToLeaders < ActiveRecord::Migration[5.2]
  def change
    rename_table :admins, :leaders
  end
end
