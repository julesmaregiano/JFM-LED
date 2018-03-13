class Report < ApplicationRecord
  belongs_to :booking
  has_one :product, through: :booking
  has_one :user, through: :booking
  has_one :technician, through: :booking, class_name: "User", foreign_key: "user_id"
  has_many :answers, dependent: :destroy
  has_many :questions, through: :answers
  has_many :sections, through: :questions
  has_attachments :photos, maximum: 20
  accepts_nested_attributes_for :answers, allow_destroy: true

  def signed?
    self.signed_on.present?
  end

end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: reports
#
#  booking_id :integer
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  signature  :binary
#  signed_on  :datetime
#  updated_at :datetime         not null
#
# Indexes
#
#  index_reports_on_booking_id  (booking_id)
#
