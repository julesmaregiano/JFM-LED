class Technician < ApplicationRecord
  belongs_to :service_provider
  has_one    :address, as: :addressable
  accepts_nested_attributes_for :address

  validates :email, :first_name, :last_name,
    presence: true,
    length:   { maximum: 255 }
end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: technicians
#
#  created_at          :datetime         not null
#  email               :string
#  first_name          :string
#  id                  :integer          not null, primary key
#  last_name           :string
#  service_provider_id :integer
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_technicians_on_service_provider_id  (service_provider_id)
#
