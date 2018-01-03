class BookedProductOption < ApplicationRecord
  belongs_to :booking
  belongs_to :option_value
end
