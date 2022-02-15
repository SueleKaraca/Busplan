class Line < ApplicationRecord
  has_many :departure_times
  has_many :stations, through: :departure_times
  belongs_to :end_station, class_name:"Station", foreign_key: "end_station_id"

  validates :name, presence: true

  scope :from_station, ->(station) { includes(:departure_times).at_station(station) }
  scope :to_end_station, ->(station) { where(end_station: station) }
end
