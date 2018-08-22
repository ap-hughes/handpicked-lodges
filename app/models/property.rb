class Property < ApplicationRecord
  scope :wood_stove, -> (wood_stove) { where wood_stove: wood_stove }
  scope :hot_tub, -> (hot_tub) { where hot_tub: hot_tub }
  scope :pet_friendly, -> (pet_friendly) { where pet_friendly: pet_friendly }
  scope :sauna, -> (sauna) { where sauna: sauna }

  mount_uploader :hero_image, PhotoUploader
  validates :code, uniqueness: true, numericality: { only_integer: true }
  serialize :features, Array
  has_many :photos, dependent: :destroy
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :photos
end
