require 'uploads'

class Photo < ApplicationRecord
  belongs_to :property
  mount_uploader :image, PhotoUploader
  has_one_attached :picture
  # validates :image, presence: true, on: :create
  validates :picture, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  before_destroy :purge_active_storage

  def picture_card_variant
    variation = ActiveStorage::Variation.new(Uploads.resize_to_fit(width: 600, height: 550, quality: 80, blob: picture.blob))
    ActiveStorage::Variant.new(picture.blob, variation)
  end

  def picture_show_variant
    variation = ActiveStorage::Variation.new(Uploads.resize_to_fit(width: 1200, height: 800, quality: 80, blob: picture.blob))
    ActiveStorage::Variant.new(picture.blob, variation)
  end

  def picture_thumbnail_variant
    variation = ActiveStorage::Variation.new(Uploads.resize_to_fit(width: 300, height: 300, quality: 70, blob: picture.blob))
    ActiveStorage::Variant.new(picture.blob, variation)
  end

  private

  def purge_active_storage
    picture.purge
  end
end
