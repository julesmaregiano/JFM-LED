class OptionValue < ApplicationRecord
  belongs_to :option

  scope :active, -> { where(active: "true") }
end
