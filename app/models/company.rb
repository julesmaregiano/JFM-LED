class Company < ApplicationRecord
  has_one :user
  has_many :branches
end
