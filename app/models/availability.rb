class Availability < ApplicationRecord
  belongs_to :user
  belongs_to :booking, optional: true

  scope :of_the_day, -> { where("date = ?", Date.today) }
  scope :of_the_week, -> { where("date <= ?", Date.today + 7)}
  scope :to_come, -> { where("date >= ?", Date.today) }
  scope :of, -> (user) {where("user_id = ? ", user.id)}
  scope :booked, -> { where.not(booking_id: nil) }
  scope :oldest_to_new, -> { order(created_at: :asc)}
end
