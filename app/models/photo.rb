class Photo < ApplicationRecord
  belongs_to :property
  mount_uploader :image, PhotoUploader
  validates :image, presence: true, on: :create

end
