class AddCustomValueToBookedProductOptions < ActiveRecord::Migration[5.1]
  def change
    add_column :booked_product_options, :custom_value, :boolean, default: false
    add_reference :booked_product_options, :option, foreign_key: true
    add_column :booked_product_options, :value, :string
  end
end
