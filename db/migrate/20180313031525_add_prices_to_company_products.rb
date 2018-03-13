class AddPricesToCompanyProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :company_products, :half_day_price, :float
    add_column :company_products, :day_price, :float
  end
end
