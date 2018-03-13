class Manager < ApplicationRecord
  belongs_to :service_provider

  validates :email, :first_name, :last_name,
    presence: true,
    length:   { maximum: 255 }

  validates :service_provider,
    presence: true
end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: managers
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
#  index_managers_on_service_provider_id  (service_provider_id)
#
