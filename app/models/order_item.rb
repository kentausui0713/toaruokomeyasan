class OrderItem < ApplicationRecord
  attachment :image
  belongs_to :order
end
