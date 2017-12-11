class Company < ApplicationRecord
  has_many :users
  has_many :branches
  has_attachment :photo
end
