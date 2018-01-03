class CreateProductOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :product_options do |t|
      t.references :product, foreign_key: true
      t.references :option, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
