require 'uploads'

class Post < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_one_attached :image
  #title maximum 120 characters
  validates :title, presence: true, length: {maximum: 120}
  validates :body, presence: true
  validates :photo, presence: true, on: :create
  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  before_destroy :purge_active_storage

  def next
    self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end

  def image_card_variant
    variation = ActiveStorage::Variation.new(Uploads.resize_to_fit(width: 600, height: 550, quality: 80, blob: image.blob))
    ActiveStorage::Variant.new(image.blob, variation)
  end

  def image_meta_variant
    variation = ActiveStorage::Variation.new(Uploads.resize_to_fit(width: 1200, height: 630, quality: 80, blob: image.blob))
    ActiveStorage::Variant.new(image.blob, variation)
  end

  def image_hero_variant
    variation = ActiveStorage::Variation.new(Uploads.resize_to_fit(width: 1800, height: 800, quality: 80, blob: image.blob))
    ActiveStorage::Variant.new(image.blob, variation)
  end

  private

  def purge_active_storage
    image.purge
  end
end
