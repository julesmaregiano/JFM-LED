class ServiceProvider < ApplicationRecord
  validates :name, presence: true
  validates :siret, presence: true
end
