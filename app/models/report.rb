class Report < ApplicationRecord
  has_one :booking
  has_one :user, through: :booking
  has_one :technician, through: :booking, class_name: "User", foreign_key: "user_id"
  has_many :answers
  has_attachments :photos

  def booker
    self.booking.users.first
  end
end
