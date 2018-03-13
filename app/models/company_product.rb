class CompanyProduct < ApplicationRecord
  belongs_to :product
  belongs_to :company

  validates :company, presence: true
  validates :product, presence: true

  validates :half_day_price, :day_price,
    presence:     true,
    numericality: true
end

# == Schema Information
# Schema version: 20180313031525
#
# Table name: company_products
#
#  company_id     :integer
#  created_at     :datetime         not null
#  day_price      :float
#  half_day_price :float
#  id             :integer          not null, primary key
#  product_id     :integer
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_company_products_on_company_id  (company_id)
#  index_company_products_on_product_id  (product_id)
#
