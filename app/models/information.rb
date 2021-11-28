class Information < ApplicationRecord
  validates :title, :content, presence: true
end
