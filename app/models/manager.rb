class Manager < ApplicationRecord
  belongs_to :service_provider

  validates :email, :first_name, :last_name,
    presence: true,
    length:   { maximum: 255 }
end
