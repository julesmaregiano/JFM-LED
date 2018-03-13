class ProductOption < ApplicationRecord
  belongs_to :product
  belongs_to :option
end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: product_options
#
#  active     :boolean
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  option_id  :integer
#  product_id :integer
#  updated_at :datetime         not null
#
# Indexes
#
#  index_product_options_on_option_id   (option_id)
#  index_product_options_on_product_id  (product_id)
#
