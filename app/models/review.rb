class Review < ApplicationRecord
  belongs_to :property
  validates :content, presence: true
  validates :content, format: { with: /\A[^"]+\z/, message: "No quotes allowed" }
  validates :date, presence: true
end
