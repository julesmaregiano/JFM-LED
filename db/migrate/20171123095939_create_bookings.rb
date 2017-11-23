class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.references :availabilities, foreign_key: true
      t.datetime :confirmed_at
      t.text :comment
      t.string :surface

      t.timestamps
    end
  end
end
