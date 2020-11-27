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
  # 通知受け取るだけ
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :circle_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, presence: true, length: { maximum: 300 }
end
