class Availability < ApplicationRecord
  belongs_to :user
  belongs_to :booking, optional: true
  after_create :init

  scope :of_the_day, -> { where("date = ?", Date.today) }
  scope :of_the_week, -> { where("date <= ?", Date.today + 7)}
  scope :to_come, -> { where("date >= ?", Date.today) }
  scope :not_today, -> { where.not("date = ?", Date.today) }
  scope :of, -> (user) {where("user_id = ? ", user.id)}
  scope :booked, -> { where(status: 0) }
  scope :oldest_to_new, -> { order(created_at: :asc)}

  enum status: [:booked, :free, :pending, :leave]

  def init
    self.update(status: 1)
  end
end
