class Booking < ApplicationRecord
  has_many :availabilities
  validates :user_id, presence: :true
  belongs_to :user

  # after_create :make_availabilities_unavailable

  def booker
  end

  def technician
  end

  private

  # def make_availabilities_unavailable
  #   self.availabitilies.each do |availability|
  #     availability.update(status: 0)
  #   end
  # end

end
