class Circle < ApplicationRecord
  attachment :image
  
  #アソシエージョン
  belongs_to :prefecture
  belongs_to :leader
end
