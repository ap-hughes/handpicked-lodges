class Review < ApplicationRecord
  belongs_to :property
  validates :content, presence: true
end
