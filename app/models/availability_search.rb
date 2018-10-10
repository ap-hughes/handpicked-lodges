class AvailabilitySearch
  include ActiveModel::Model

  attr_accessor :start_date, :nights
  validates :start_date, :nights, presence: :true
end
