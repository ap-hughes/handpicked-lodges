class Feature < ApplicationRecord
  belongs_to :property
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :property_id
end
