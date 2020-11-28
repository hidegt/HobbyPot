class Category < ApplicationRecord
  validates :category_name,presence:true,length:{maximum:50}
  has_many :circle_categories, dependent: :destroy
  has_many :circles, through: :circle_categories
end
