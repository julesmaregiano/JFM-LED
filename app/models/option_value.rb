class OptionValue < ApplicationRecord
  belongs_to :option

  scope :active, -> { where(active: "true") }
end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: option_values
#
#  active     :boolean
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  label      :string
#  option_id  :integer
#  updated_at :datetime         not null
#
# Indexes
#
#  index_option_values_on_option_id  (option_id)
#
