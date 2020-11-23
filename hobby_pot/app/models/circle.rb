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
  has_many :circle_categories, dependent: :destroy
  has_many :categories, through: :circle_categories
  def save_categories(categories)
    current_categories = self.categories.pluck(:category_name) unless self.categories.nil?
    old_categories = current_categories - categories
    new_categories = categories - current_categories
    #古いタグを消す
    old_categories.each do |old_name|
      self.categories.delete Category.find_by(category_name:old_name)
    end
    #新しいタグを作成
    new_categories.each do |new_name|
      circle_category = Category.find_or_create_by(category_name:new_name)
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

  #ステータス
  def status
    if circle_status
     "公開する"
    else
      "非公開"
    end
  end

  #バリデーション
  validate :date_before_start
  def date_before_start
    return if start_time.blank?
    errors.add(:start_time,"は今日以降のものを選択してください") if start_time < Date.today
  end
end
