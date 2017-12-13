class CreateAvailabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :availabilities do |t|
      t.references :user, foreign_key: true
      t.references :booking, foreign_key: true
      t.date :date
      t.integer :status
      t.integer :half

      t.timestamps
    end
  end
end
