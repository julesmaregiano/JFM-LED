class Booking < ApplicationRecord
  has_many :availabilities
  belongs_to :report
  validates :user_id, presence: :true
  validates :availabilities, presence: :true
  belongs_to :user
  geocoded_by :address
  after_create :geocode
  after_validation :geocode, if: :address_changed?

  scope :of_the_day, -> { joins(:availabilities).where("date = ?", Date.today) }
  scope :to_come, -> { joins(:availabilities).where("date > ?", Date.yesterday) }
  scope :soon, -> { joins(:availabilities).where("date < ?", Date.today + 7) }
  scope :for, -> (user) { joins(:availabilities).where(user_id: user.id) }
  # Ce scope ne marche pas. Comment faire pour trouver tous les Bookings appartenant à un tech ?

  def self.for_next_week
    self.to_come.soon
      # .for(user)
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
