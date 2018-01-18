class ProductQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :product
end
