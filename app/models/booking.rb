  class Booking < ApplicationRecord
  has_many :availabilities
  has_many :users, through: :availabilities
  has_many :booked_product_options, dependent: :destroy
  has_many :option_values, through: :booked_product_options, dependent: :destroy
  delegate :branch, to: :user

  belongs_to :product
  belongs_to :foreman, optional: true
  belongs_to :user

  validates :user_id, presence: true
  validates :availabilities, presence: true

  has_one :address, dependent: :destroy
  has_one :report, dependent: :destroy

  has_attachment :pdf
  accepts_nested_attributes_for :address

  after_create :add_report

  scope :of_the_day, -> { joins(:availabilities).where("date = ?", Date.current) }
  scope :for_this_branch, -> { joins(:availabilities).where("date = ?", Date.current) }
  scope :to_come, -> { joins(:availabilities).where("date > ?", Date.yesterday) }
  scope :soon, -> { joins(:availabilities).where("date < ?", Date.current + 7) }
  scope :status, -> (status) { joins(:availabilities).where("status = ?", status)}
  scope :branch, -> (branch) { joins(:user).where(branch: branch) }

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
    end.uniq
  end

  def tech_of_the_day
    self.availabilities.of_the_day.first.user
  end

  def add_report
    if self.report.nil?
      Report.create(booking: self)
    end
  end

end
