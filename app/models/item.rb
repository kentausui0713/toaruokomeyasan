class Item < ApplicationRecord
  attachment :image
  has_many :items, dependent: :destroy
end
