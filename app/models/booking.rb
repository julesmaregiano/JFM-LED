class Booking < ApplicationRecord
  has_many :availabilities
  validates :user_id, presence: :true
  belongs_to :user

  def booker
    self.user
  end

  def technician
  end

end
