class CreateForemen < ActiveRecord::Migration[5.1]
  def change
    create_table :foremen do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.references :branch, foreign_key: true

      t.timestamps
    end
  end
end
