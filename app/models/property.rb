class Property < ApplicationRecord
  mount_uploader :hero_image, PhotoUploader
  validates :code, uniqueness: true, numericality: { only_integer: true }
  serialize :features, Array
  has_many :photos, dependent: :destroy
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :photos
end
