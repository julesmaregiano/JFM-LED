class Company < ApplicationRecord
  has_many :users
  has_many :branches
  has_many :products, through: :company_products
  has_attachment :photo
end
