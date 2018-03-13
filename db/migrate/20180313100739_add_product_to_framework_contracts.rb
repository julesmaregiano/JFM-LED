class AddProductToFrameworkContracts < ActiveRecord::Migration[5.1]
  def change
    add_reference :framework_contracts, :product, foreign_key: true
  end
end
