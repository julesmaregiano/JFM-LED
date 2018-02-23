class AddOrderToSections < ActiveRecord::Migration[5.1]
  def change
    add_column :sections, :order, :integer
  end
end
