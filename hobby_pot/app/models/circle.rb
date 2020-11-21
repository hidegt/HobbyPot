class Circle < ApplicationRecord
  attachment :image
  belongs_to :leader
  #お気に入り
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  #コメント
  has_many :circle_comments, dependent: :destroy

  #参加
  has_many :join_circles, dependent: :destroy
  def joined_by?(user)
    join_circles.where(user_id: user.id).exists?
  end

  # タグ
  has_many :categories, through: :circle_categories
  has_many :circle_categories, dependent: :destroy
  def save_categories(tags)
    current_tags = slf.categories.pluck(:category_name) unless self.categories.nill?
    old_tags = current_tags - tags
    new_tags = tags - current_tags
    #古いタグを消す
    old_tags.each do |old_name|
      self.categories.delete Category.find_by(name:old_name)
    end
    #新しいタグを消す
    new_tags.each do |new_name|
      circle_category = Category.find_or_create_by(name:new_name)
      self.categories << circle_category
    end
  end

  # 住所自動入力
  include JpPrefecture
  jp_prefecture :prefecture_code
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  def status
    if circle_status
     "公開する"
    else
      "非公開"
    end
  end
end
