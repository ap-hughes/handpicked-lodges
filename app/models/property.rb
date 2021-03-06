require 'uploads'

class Property < ApplicationRecord
  include Filterable
  attr_accessor :price, :book_link, :price_message, :start_date, :nights
  scope :wood_stove, -> (wood_stove) { where wood_stove: wood_stove }
  scope :hot_tub, -> (hot_tub) { where hot_tub: hot_tub }
  scope :pet_friendly, -> (pet_friendly) { where pet_friendly: pet_friendly }
  scope :sauna, -> (sauna) { where sauna: true }
  scope :in_aviemore, -> (in_aviemore) { where in_aviemore: in_aviemore }
  scope :in_country, -> (in_country) { where in_country: in_country }
  scope :sauna_or_hot_tub, -> (sauna_or_hot_tub) { hot_tub(true).or(sauna(true)) }

  mount_uploader :hero_image, PhotoUploader
  has_one_attached :main_image
  mount_uploader :floorplan, PhotoUploader
  has_one_attached :floorplan_image
  validates :code, uniqueness: true, numericality: { only_integer: true }
  validates :meta_title, length: { maximum: 80 }
  validates :meta_description, length: { maximum: 300 }
  validates :headline, length: { maximum: 150 }
  validates :we_love, presence: true
  validates :sleeps, :bedrooms, :bathrooms, numericality: { only_integer: true }
  has_many :photos, dependent: :destroy
  scope :with_attached_photos, -> { includes(:photos).merge(Photo.with_attached_picture) }
  has_many :reviews, dependent: :destroy
  has_many :features, dependent: :destroy
  accepts_nested_attributes_for :features,
    allow_destroy: true
  accepts_nested_attributes_for :photos,
    allow_destroy: true,
    :reject_if => proc { |att| att[:image].blank? }
  before_destroy :purge_active_storage
  validates :main_image, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  validates :floorplan_image, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  def main_image_card_variant
    variation = ActiveStorage::Variation.new(Uploads.resize_to_fit(width: 600, height: 550, quality: 80, blob: main_image.blob))
    ActiveStorage::Variant.new(main_image.blob, variation)
  end

  def main_image_map_variant
    variation = ActiveStorage::Variation.new(Uploads.resize_to_fit(width: 400, height: 300, quality: 80, blob: main_image.blob))
    ActiveStorage::Variant.new(main_image.blob, variation)
  end

  def main_image_meta_variant
    variation = ActiveStorage::Variation.new(Uploads.resize_to_fit(width: 1200, height: 630, quality: 80, blob: main_image.blob))
    ActiveStorage::Variant.new(main_image.blob, variation)
  end

  def main_image_show_variant
    variation = ActiveStorage::Variation.new(Uploads.resize_to_fit(width: 1200, height: 800, quality: 80, blob: main_image.blob))
    ActiveStorage::Variant.new(main_image.blob, variation)
  end

  def main_image_thumbnail_variant
    variation = ActiveStorage::Variation.new(Uploads.resize_to_fit(width: 300, height: 300, quality: 70, blob: main_image.blob))
    ActiveStorage::Variant.new(main_image.blob, variation)
  end

  # def floorplan_image_variant
  # end

  private

  def purge_active_storage
    main_image.purge
    floorplan_image.purge
  end
end
