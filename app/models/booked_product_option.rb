class BookedProductOption < ApplicationRecord
  belongs_to :booking
  belongs_to :option_value, optional: true
  belongs_to :option
end
