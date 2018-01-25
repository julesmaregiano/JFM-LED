class AddSignatureToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :signature, :binary
    add_column :reports, :signed_on, :datetime
  end
end
