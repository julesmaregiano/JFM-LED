class Booking < ApplicationRecord
  has_many :availabilities
  validates :user_id, presence: :true
  belongs_to :user

  def booker
  end

  def technician
  end

  private

end
