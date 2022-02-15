class DepartureTime < ApplicationRecord
  belongs_to :line
  belongs_to :station
  belongs_to :day_of_week

  scope :at_station, ->(station) { where(station: station) }

end
