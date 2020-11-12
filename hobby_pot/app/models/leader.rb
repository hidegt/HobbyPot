class Leader < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  attachment :leader_image
  
  #アソシエーション
  has_many :circles, dependent: :destroy
  #お気に入り
  has_many :favorites, dependent: :destroy
  #fav_circleはcircle_idを使ってcircleテーブルと繋がる意味。
  # sourceでどのテーブルと繋がるか参照
  has_many :fav_circles, through: :favorites, source: :circle

end
