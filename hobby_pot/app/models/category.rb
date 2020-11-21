class Category < ApplicationRecord
  validates :name,presence:true,length:{maximum:50}
  has_many :categories, through: :circle_categories
  has_many :circle_categories, dependent: :destroy
end
