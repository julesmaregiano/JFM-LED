  class Booking < ApplicationRecord
  has_many :availabilities
  has_many :users, through: :availabilities
  has_many :booked_product_options, dependent: :destroy
  has_many :option_values, through: :booked_product_options, dependent: :destroy
  belongs_to :product
  has_attachment :pdf

  belongs_to :foreman, optional: true
  has_one :report, dependent: :destroy
  validates :user_id, presence: true
  validates :availabilities, presence: true
  belongs_to :user
  geocoded_by :address
  after_create :geocode, :add_report
  after_validation :geocode, if: :address1_changed?

  scope :of_the_day, -> { joins(:availabilities).where("date = ?", Date.current) }
  scope :to_come, -> { joins(:availabilities).where("date > ?", Date.yesterday) }
  scope :soon, -> { joins(:availabilities).where("date < ?", Date.current + 7) }
  scope :for, -> (user) { joins(:availabilities).where(user_id: user.id) }
  scope :status, -> (status) { joins(:availabilities).where("status = ?", status)}

  def self.status_is(status)
    self.status(status).uniq
  end

  def self.for_next_week_for(user)
    bookings = self.to_come.soon.map do |booking|
      if booking.technicians.include?(user)
        booking
      end
    end
    bookings.uniq
  end

  def has_foreman
    Foreman.find(self.foreman_id)
  end

  def technicians
    self.availabilities.map do |availability|
      availability.user
    end
  end

  def tech_of_the_day
    self.availabilities.of_the_day.first.user
  end

  def address
    [address1, address2, city, zipcode, country].compact.join(', ')
  end

  def add_report
    if self.report.nil?
      Report.create(booking: self)
    end
  end

end
