class Photo < ApplicationRecord
  belongs_to :property
  mount_uploader :image, PhotoUploader
  has_one_attached :picture
  # validates :image, presence: true, on: :create
  validates :picture, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  before_destroy :purge_active_storage

  private

  def purge_active_storage
    picture.purge
  end
end
