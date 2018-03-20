class ServiceProvider < ApplicationRecord
  validates :name,  presence: true
  validates :siret, presence: true

  has_one  :address,  as: :addressable
  has_many :technicians
  has_many :bookings
  has_many :managers

  has_attachment :photo

end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: service_providers
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string
#  siret      :string
#  updated_at :datetime         not null
#
