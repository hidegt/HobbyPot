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
  has_many :join_statuses
  
  attachment :user_image
end
