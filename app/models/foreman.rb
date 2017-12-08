class Foreman < ApplicationRecord
  belongs_to :branch
  has_many :bookings
end
