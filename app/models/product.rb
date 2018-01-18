class Product < ApplicationRecord
  has_many :companies, through: :company_products
  has_many :product_options, dependent: :destroy
  has_many :options, through: :product_options
  has_many :option_values, through: :options
  has_many :product_questions
  has_many :questions, through: :product_questions
end

