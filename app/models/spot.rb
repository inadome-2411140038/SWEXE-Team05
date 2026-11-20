class Spot < ApplicationRecord
  has_one_attached :image

  belongs_to :category

  validates :name, presence: true
end