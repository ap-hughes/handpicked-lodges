class Photo < ApplicationRecord
  belongs_to :property
  mount_uploader :image, PhotoUploader

end
