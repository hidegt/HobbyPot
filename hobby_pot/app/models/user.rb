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
  # sourceでどのテーブルと繋がるか参照
  has_many :fav_circles, through: :favorites, source: :circle
  #コメント
  has_many :circle_comments, dependent: :destroy
  #参加
  has_many :join_circles, dependent: :destroy
  has_many :j_circles, through: :join_circles, source: :circle
  attachment :user_image
  
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :circle_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, presence: true, length: { maximum: 300 }
end
