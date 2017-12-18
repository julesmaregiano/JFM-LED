class BookingGrid < ApplicationRecord
  belongs_to :grid_type
  belongs_to :booking
end
