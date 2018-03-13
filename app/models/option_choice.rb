class OptionChoice < ApplicationRecord
  belongs_to :option_group
  validates :name, presence: true
end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: option_choices
#
#  created_at      :datetime         not null
#  id              :integer          not null, primary key
#  name            :string
#  option_group_id :integer
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_option_choices_on_option_group_id  (option_group_id)
#
