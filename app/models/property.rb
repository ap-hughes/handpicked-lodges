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
  has_many :reviews, dependent: :destroy
  has_many :features, dependent: :destroy
  accepts_nested_attributes_for :features,
    allow_destroy: true
  accepts_nested_attributes_for :photos,
    allow_destroy: true,
    :reject_if => proc { |att| att[:image].blank? }
  before_destroy :purge_active_storage
  validates :main_image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  validates :floorplan_image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  private

  def purge_active_storage
    main_image.purge
  end
end
