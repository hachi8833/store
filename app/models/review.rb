class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many_attached :images
end
