class Product < ApplicationRecord
  has_many :companies, through: :company_products
  has_many :product_options
  has_many :options, through: :product_options
end
