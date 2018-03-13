class Company < ApplicationRecord
  validates :name, presence: :true

  has_many :users
  has_many :branches
  has_many :company_products
  has_many :products, through: :company_products
  has_one  :address, as: :addressable

  has_attachment :photo

end

# == Schema Information
# Schema version: 20180313013358
#
# Table name: companies
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string
#  siret      :string
#  updated_at :datetime         not null
#
