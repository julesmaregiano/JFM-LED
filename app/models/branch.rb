class Branch < ApplicationRecord
  belongs_to :company
  has_many :foremen
end