class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts
  has_many :orders
  has_many :favorites
  has_many :comments

  validates :name, :name_kana, :phone_num, :address, :postal_code, presence: true
  validates :name_kana, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "はカタカナにしてください"}
  validates :phone_num, :postal_code, numericality: {only_integer: true, message: "は数字のみにしてください"}
  validates :postal_code, length: {is: 7, message: "は7桁になります"}
end
