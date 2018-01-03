class Option < ApplicationRecord
  has_many :option_values
  has_many :product_options
  has_many :product, through: :product_options
end
