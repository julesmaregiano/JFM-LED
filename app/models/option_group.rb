class OptionGroup < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :option_choices
end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: option_groups
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string
#  updated_at :datetime         not null
#
