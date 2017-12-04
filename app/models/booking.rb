class Booking < ApplicationRecord
  has_many :availabilities
  belongs_to :report
  validates :user_id, presence: :true
  belongs_to :user
  geocoded_by :address
  after_create :geocode
  after_validation :geocode, if: :address_changed?

  scope :of_the_day, -> { joins(:availabilities).where("date = ?", Date.today) }

  def booker
  end

  def technicians
    self.availabilities.map do |availability|
      availability.user
    end
  end

  def tech_of_the_day
    self.availabilities.of_the_day.first.user
  end

  private

end
