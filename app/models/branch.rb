class Branch < ApplicationRecord
  belongs_to :company
  has_many :foremen
  has_one :address
  accepts_nested_attributes_for :address

end
