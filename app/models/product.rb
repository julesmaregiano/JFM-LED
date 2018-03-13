class Product < ApplicationRecord
  has_many :company_products
  has_many :companies, through: :company_products

  has_many :product_options, dependent: :destroy
  has_many :options, through: :product_options
  has_many :option_values, through: :options
  has_many :product_questions
  has_many :questions, through: :product_questions
  has_many :sections, through: :questions
end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: products
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  label      :string
#  updated_at :datetime         not null
#
