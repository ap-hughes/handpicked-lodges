class Property < ApplicationRecord
  include Filterable
  scope :wood_stove, -> (wood_stove) { where wood_stove: wood_stove }
  scope :hot_tub, -> (hot_tub) { where hot_tub: hot_tub }
  scope :pet_friendly, -> (pet_friendly) { where pet_friendly: pet_friendly }
  scope :sauna, -> (sauna) { where sauna: true }
  scope :in_aviemore, -> (in_aviemore) { where in_aviemore: in_aviemore }
  scope :in_country, -> (in_country) { where in_country: in_country }
  scope :sauna_or_hot_tub, -> (sauna_or_hot_tub) { hot_tub(true).or(sauna(true)) }

  mount_uploader :hero_image, PhotoUploader
  validates :code, uniqueness: true, numericality: { only_integer: true }
  validates :meta_title, length: { maximum: 80 }
  validates :meta_description, length: { maximum: 300 }
  validates :headline, length: { maximum: 150 }
  validates :sleeps, :bedrooms, :bathrooms, numericality: { only_integer: true }
  has_many :photos, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :features, dependent: :destroy
  accepts_nested_attributes_for :features,
    allow_destroy: true
  accepts_nested_attributes_for :photos,
    allow_destroy: true,
    :reject_if => proc { |att| att[:image].blank? }
end
