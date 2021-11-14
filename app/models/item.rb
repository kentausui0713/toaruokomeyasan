class Item < ApplicationRecord
  attachment :image
  has_many :carts, dependent: :destroy
end
