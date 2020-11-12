class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :circle, foreign_key: true
      t.references :leader, foreign_key: true

      t.timestamps
      #同じ投稿を何度もお気に入り投稿できないようにする
      t.index [:user_id, :circle_id], unique: true
      t.index [:leader_id, :circle_id], unique: true
    end
  end
end
