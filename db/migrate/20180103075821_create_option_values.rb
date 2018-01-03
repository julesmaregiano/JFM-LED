class CreateOptionValues < ActiveRecord::Migration[5.1]
  def change
    create_table :option_values do |t|
      t.references :option, foreign_key: true
      t.string :label
      t.boolean :active
      t.timestamps
    end
  end
end
