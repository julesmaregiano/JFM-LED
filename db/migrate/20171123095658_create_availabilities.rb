class CreateAvailabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :availabilities do |t|
      t.references :user, foreign_key: true
      t.date :date
      t.string :status
      t.string :half

      t.timestamps
    end
  end
end
