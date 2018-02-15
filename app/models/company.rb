class Company < ApplicationRecord
  validates :name, presence: :true
  has_many :users
  has_many :branches
  has_many :company_products
  has_many :products, through: :company_products

  has_attachment :photo

  include AlgoliaSearch
  algoliasearch do
    attribute :id, :name, :photo
  end

end
