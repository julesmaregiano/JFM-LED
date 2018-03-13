class Option < ApplicationRecord
  has_many :option_values, dependent: :destroy
  has_many :product_options, dependent: :destroy
  has_many :product, through: :product_options
  has_many :booked_product_options
end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: options
#
#  created_at   :datetime         not null
#  custom_value :boolean          default("false")
#  id           :integer          not null, primary key
#  label        :string
#  updated_at   :datetime         not null
#
