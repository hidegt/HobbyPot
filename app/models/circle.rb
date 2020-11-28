class Circle < ApplicationRecord
  attachment :image
  belongs_to :leader
  #お気に入り
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  #コメント
  has_many :circle_comments, dependent: :destroy

  #参加
  has_many :join_circles, dependent: :destroy
  has_many :joined_users, through: :join_circles, source: :user
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
  # 通知
  has_many :notifications, dependent: :destroy
  def create_notification_favorite!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id =? and circle_id =? and action =?", current_user.id, leader_id, id, 'favorite'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        circle_id: id,
        visited_id: leader_id,
        action: 'favorite'
      )
      notification.save if notification.valid?
    end
  end
  def create_notification_join_circle!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id =? and join_circle_id =? and action =?", current_user.id, leader_id, id, 'join_circle'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        circle_id: id,
        visited_id: leader_id,
        action: 'join_circle'
      )
      notification.save if notification.valid?
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
  validates :circle_title, presence: true, length: { maximum: 100 }
  validates :circle_about, presence: true, length: { maximum: 300 }
  validates :schedule, presence: true, length: { maximum: 300 }
  validates :prepare, presence: true, length: { maximum: 300 }
  validates :join_cost, presence: true
  validates :number_people, presence: true
end
