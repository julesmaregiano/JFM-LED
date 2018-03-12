class ServiceProvider < ApplicationRecord
  validates :name,  presence: true
  validates :siret, presence: true

  has_many :technicians
  has_many :managers
end
