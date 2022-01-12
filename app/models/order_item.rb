class OrderItem < ApplicationRecord
  attachment :image
  belongs_to :order
  
  validates :item_id, presence: true
end
