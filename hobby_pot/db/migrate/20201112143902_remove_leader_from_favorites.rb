class RemoveLeaderFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_reference :favorites, :leader, foreign_key: true, index: true
  end
end
