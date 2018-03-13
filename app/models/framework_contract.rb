class FrameworkContract < ApplicationRecord
  belongs_to :company
  belongs_to :service_provider
end

# == Schema Information
# Schema version: 20180313013829
#
# Table name: framework_contracts
#
#  company_id          :integer
#  created_at          :datetime         not null
#  day_price           :float
#  ends_at             :date
#  hal_day_price       :integer
#  id                  :integer          not null, primary key
#  service_provider_id :integer
#  starts_at           :date
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_framework_contracts_on_company_id           (company_id)
#  index_framework_contracts_on_service_provider_id  (service_provider_id)
#
