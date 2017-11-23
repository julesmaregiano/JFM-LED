class Booking < ApplicationRecord
  belongs_to :technician, class_name: "User", foreign_key: "user_id"
  has_many :availabilities
  validates :user_id, presence: :true
  belongs_to :user

  def booker
    self.user
  end

  def technician
  end

end
