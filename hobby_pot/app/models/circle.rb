class Circle < ApplicationRecord
  attachment :image
  belongs_to :leader
end
