class Report < ApplicationRecord
  has_one :booking
  has_one :user, through: :booking
  has_one :technician, through: :booking, class_name: "User", foreign_key: "user_id"
  has_many :answers
  validates :booking, presence: true
  has_attachments :photos, maximum: 10

  def booker
    self.booking.users.first
  end

  def done?
    self.answers.size > 0
  end
end
