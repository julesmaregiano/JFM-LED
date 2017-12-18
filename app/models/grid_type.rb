class GridType < ApplicationRecord
  has_many :booking_grids
  has_many :bookings
end
