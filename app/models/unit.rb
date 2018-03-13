class Unit < ApplicationRecord
  has_many :questions
  validates :name, presence: true
end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: units
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string
#  updated_at :datetime         not null
#
