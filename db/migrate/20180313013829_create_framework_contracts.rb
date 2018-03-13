class CreateFrameworkContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :framework_contracts do |t|
      t.date :starts_at
      t.date :ends_at
      t.float :day_price
      t.integer :hal_day_price
      t.references :company, foreign_key: true
      t.references :service_provider, foreign_key: true

      t.timestamps
    end
  end
end
