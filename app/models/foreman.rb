class Foreman < ApplicationRecord
  belongs_to :branch
  has_many :bookings
end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: foremen
#
#  branch_id  :integer
#  created_at :datetime         not null
#  first_name :string
#  id         :integer          not null, primary key
#  last_name  :string
#  phone      :string
#  updated_at :datetime         not null
#
# Indexes
#
#  index_foremen_on_branch_id  (branch_id)
#
