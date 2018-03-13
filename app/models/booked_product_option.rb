class BookedProductOption < ApplicationRecord
  belongs_to :booking
  belongs_to :option_value, optional: true
  belongs_to :option
end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: booked_product_options
#
#  booking_id      :integer
#  created_at      :datetime         not null
#  custom_value    :boolean          default("false")
#  id              :integer          not null, primary key
#  option_id       :integer
#  option_value_id :integer
#  updated_at      :datetime         not null
#  value           :string
#
# Indexes
#
#  index_booked_product_options_on_booking_id       (booking_id)
#  index_booked_product_options_on_option_id        (option_id)
#  index_booked_product_options_on_option_value_id  (option_value_id)
#
