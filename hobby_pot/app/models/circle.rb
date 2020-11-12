class Circle < ApplicationRecord
  attachment :image
  belongs_to :leader
  belongs_to :user
  

  #お気に入り
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  #コメント
  has_many :circle_comments, dependent: :destroy
  # 住所自動入力
  include JpPrefecture
  jp_prefecture :prefecture_code
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
