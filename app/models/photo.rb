class Photo < ApplicationRecord
  belongs_to :property
  # mount_uploader :image, PhotoUploader
  has_one_attached :image
  # validates :image, presence: true, on: :create
  validate :image_format
  after_detroy :purge_active_storage

  private

  def image_format
    return unless image.attached?
    return if image.blob.content_type.start_with? 'image/'
    image.purge
    errors.add(:image, 'needs to be an image')
  end

  def purge_active_storage
    image.purge
  end
end
