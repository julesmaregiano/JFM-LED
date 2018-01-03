class CreateBookedProductOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :booked_product_options do |t|
      t.references :booking, foreign_key: true
      t.references :option_value, foreign_key: true

      t.timestamps
    end
  end
end
