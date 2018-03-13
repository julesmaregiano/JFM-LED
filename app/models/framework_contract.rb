class FrameworkContract < ApplicationRecord
  belongs_to :company
  belongs_to :product
  belongs_to :service_provider

  validates :starts_at, :ends_at,
    presence: true

  validates :half_day_price, :day_price,
    presence:     true,
    numericality: true
end

# == Schema Information
# Schema version: 20180313100739
#
# Table name: framework_contracts
#
#  company_id          :integer
#  created_at          :datetime         not null
#  day_price           :float
#  ends_at             :date
#  half_day_price      :integer
#  id                  :integer          not null, primary key
#  product_id          :integer
#  service_provider_id :integer
#  starts_at           :date
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_framework_contracts_on_company_id           (company_id)
#  index_framework_contracts_on_product_id           (product_id)
#  index_framework_contracts_on_service_provider_id  (service_provider_id)
#
