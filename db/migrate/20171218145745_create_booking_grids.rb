class CreateBookingGrids < ActiveRecord::Migration[5.1]
  def change
    create_table :booking_grids do |t|
      t.references :grid_type, foreign_key: true
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
