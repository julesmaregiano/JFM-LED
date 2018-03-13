class Address < ApplicationRecord
  belongs_to :booking, optional: true
  belongs_to :branch, optional: true

  geocoded_by :full_address
  after_validation :geocode, if: :address1_changed?
  after_create :geocode

  def full_address
    [address1, address2, city, zipcode, country].compact.join(', ')
  end

end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: addresses
#
#  address1   :string
#  address2   :string
#  address3   :string
#  address4   :string
#  booking_id :integer
#  branch_id  :integer
#  city       :string
#  country    :string
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  latitude   :float
#  longitude  :float
#  updated_at :datetime         not null
#  zipcode    :string
#
# Indexes
#
#  index_addresses_on_booking_id  (booking_id)
#  index_addresses_on_branch_id   (branch_id)
#
