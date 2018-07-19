class Property < ApplicationRecord
  validates :code, uniqueness: true, numericality: { only_integer: true }
  serialize :features, Array
end
