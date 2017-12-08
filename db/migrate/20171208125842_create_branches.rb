class CreateBranches < ActiveRecord::Migration[5.1]
  def change
    create_table :branches do |t|
      t.string :name
      t.string :city
      t.string :zipcode
      t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
