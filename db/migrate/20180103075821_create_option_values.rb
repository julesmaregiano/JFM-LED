class CreateOptionValues < ActiveRecord::Migration[5.1]
  def change
    create_table :option_values do |t|
      t.references :option, foreign_key: true

      t.timestamps
    end
  end
end
