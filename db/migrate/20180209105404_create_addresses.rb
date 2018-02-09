class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :address4
      t.string :city
      t.string :zipcode
      t.string :country
      t.float :latitude
      t.float :longitude
      t.references :booking, foreign_key: true
      t.timestamps
    end
  end
end
