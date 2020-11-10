class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 #is_deletedがfalseの場合はlog inすることができる
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  #is_deletedがtrueの場合のエラーメッセージ(<% alert %>に表示)
  def inactive_message
    "退会済みです"
  end
  attachment :user_image
  #アソシエージョン
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
