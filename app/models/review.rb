class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, presence: true, length: { maximum: 1000,
    too_long: "%{count} characters is the maximum allowed" }
  validates :rating, presence: true
  # numericality check
  RATINGS = [0,1,2,3,4,5]
  validates :rating, numericality: {only_integer: true }, inclusion: { in: RATINGS }
end
