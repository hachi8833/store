class Review < ApplicationRecord
  belongs_to :product, counter_cache: true
  belongs_to :user
  has_many_attached :images

  validates :body, presence: true
  validates :rating, presence: true, numericality: { in: 1..5, only_integer: true }
end