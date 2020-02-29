class Page < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :meta_title, length: { maximum: 80 }
  validates :meta_description, length: { maximum: 160 }
end
