class CompanyProduct < ApplicationRecord
  belongs_to :product
  belongs_to :company
end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: company_products
#
#  company_id :integer
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  product_id :integer
#  updated_at :datetime         not null
#
# Indexes
#
#  index_company_products_on_company_id  (company_id)
#  index_company_products_on_product_id  (product_id)
#
