class Station < ApplicationRecord
  has_many :departure_times
  has_many :lines, through: :departure_times

  validates :name, presence: true, uniqueness: true

  scope :names_in, ->(arr) { where(name: arr) }
end
