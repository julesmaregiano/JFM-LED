class Option < ApplicationRecord
  has_many :option_values, dependent: :destroy
  has_many :product_options, dependent: :destroy
  has_many :product, through: :product_options
end
