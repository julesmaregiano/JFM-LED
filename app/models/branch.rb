class Branch < ApplicationRecord
  belongs_to :company
  has_many :foremen
  has_one :address
  accepts_nested_attributes_for :address
  geocoded_by :full_address
  after_validation :geocode, if: :address1_changed?
  after_create :geocode

  def full_address
    [address1, address2, city, zipcode, country].compact.join(', ')
  end

end
