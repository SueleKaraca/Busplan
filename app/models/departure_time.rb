class DepartureTime < ApplicationRecord
  belongs_to :line
  belongs_to :station
  belongs_to :day_of_week


end
