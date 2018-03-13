class Branch < ApplicationRecord
  belongs_to :company
  has_many :foremen
  has_one :address
  accepts_nested_attributes_for :address

end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: branches
#
#  city       :string
#  company_id :integer
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string
#  updated_at :datetime         not null
#  zipcode    :string
#
# Indexes
#
#  index_branches_on_company_id  (company_id)
#
