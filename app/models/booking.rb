class Booking < ApplicationRecord
  has_many :availabilities
  belongs_to :report
  validates :user_id, presence: :true
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def booker
  end

  def technician
  end

  private

end
