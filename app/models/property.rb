class Property < ApplicationRecord
  mount_uploader :hero_image, PhotoUploader
  validates :code, uniqueness: true, numericality: { only_integer: true }
  serialize :features, Array
end
