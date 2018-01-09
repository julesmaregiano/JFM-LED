class AddBookingsToReports < ActiveRecord::Migration[5.1]
  def change
    add_reference :reports, :booking, foreign_key: true
  end
end
