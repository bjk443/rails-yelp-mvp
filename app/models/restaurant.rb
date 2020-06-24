class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy # can call any restaurant.review
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :name, :phone_number, :address, :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
