class Spot < ApplicationRecord
  has_one_attached :image

  belongs_to :category

  validates :name, presence: true

  validates :name_kana,
            format: {
              with: /\A[ぁ-ゖー　 ]+\z/,
              message: "はひらがなで入力してください"
            },
            allow_blank: true
end