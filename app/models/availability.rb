class Availability < ApplicationRecord
  belongs_to :user,    optional: true
  belongs_to :booking, optional: true
  belongs_to :technician
  after_create :init

  scope :of,    -> (user) { where("user_id = ? ", user.id)}
  scope :to_come,      -> { where("date >= ?", Date.current) }
  scope :morning,      -> { where(half: "matin") }
  scope :not_today,    -> { where.not("date = ?", Date.current) }
  scope :afternoon,    -> { where(half: "aprem") }
  scope :free_first,   -> { order(status: :asc) }
  scope :of_the_day,   -> { where("date = ?", Date.current) }
  scope :of_the_week,  -> { where("date <= ?", Date.current + 7)}
  scope :of_last_week, -> { where("date >= ?", Date.current - 7)}
  scope :oldest_to_new,-> { order(created_at: :asc)}

  enum status: [:free, :pending, :leave, :booked, :vacation, :training, :unavailable]
  enum half:   [:matin, :aprem]

  def self.of_the_week_for(user)
    self.to_come
        .of_the_week
        .of(user)
        .booked
        .oldest_to_new
  end

  def init
    self.update(status: "free")
  end

  def self.best_for_morning_booking
    self.morning.free_first
  end

  def self.best_for_afternoon_booking
    # De l'aprem, et en plus les free first.
    self.afternoon.free_first.order("user_id ASC")
    # Si le technicien de free_first le matin est libre, je propose ce technicien l'apres-midi en premier
    # Si le technicien du matin
  end

  def reset
    if self.booking.nil? && (DateTime.now.to_f - self.updated_at.to_f) > 1 #permet d'éviter le stack level too deep
      self.update!(status: "free")
    elsif self.booking.present? && self.free? && (DateTime.now.to_f - self.updated_at.to_f) > 1
      self.update!(status: "pending")
    end
  end

end

# == Schema Information
# Schema version: 20180316173732
#
# Table name: availabilities
#
#  booking_id    :integer
#  created_at    :datetime         not null
#  date          :date
#  half          :integer
#  id            :integer          not null, primary key
#  status        :integer
#  technician_id :integer
#  updated_at    :datetime         not null
#  user_id       :integer
#
# Indexes
#
#  index_availabilities_on_booking_id                       (booking_id)
#  index_availabilities_on_technician_id                    (technician_id)
#  index_availabilities_on_technician_id_and_date_and_half  (technician_id,date,half) UNIQUE
#  index_availabilities_on_user_id                          (user_id)
#
