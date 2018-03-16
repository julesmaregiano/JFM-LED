class Foreman < ApplicationRecord
  belongs_to :branch
  belongs_to :service_provider

  has_many :bookings
end

# == Schema Information
# Schema version: 20180316095812
#
# Table name: foremen
#
#  branch_id           :integer
#  created_at          :datetime         not null
#  first_name          :string
#  id                  :integer          not null, primary key
#  last_name           :string
#  phone               :string
#  service_provider_id :integer
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_foremen_on_branch_id            (branch_id)
#  index_foremen_on_service_provider_id  (service_provider_id)
#
