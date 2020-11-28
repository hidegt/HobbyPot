class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #アソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  #お気に入り
  has_many :favorites, dependent: :destroy
  #fav_circleはcircle_idを使ってcircleテーブルと繋がる意味。
  has_many :fav_circles, through: :favorites, source: :circle
  #コメント
  has_many :circle_comments, dependent: :destroy
  #参加
  has_many :join_circles, dependent: :destroy
  has_many :j_circles, through: :join_circles, source: :circle
  
  attachment :user_image
  # 通知送るだけ
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 300 }
end
