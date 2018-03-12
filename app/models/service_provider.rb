class ServiceProvider < ApplicationRecord
  validates :name,  presence: true
  validates :siret, presence: true

  has_many :technicians
end
