class AddCustomValueToOptions < ActiveRecord::Migration[5.1]
  def change
    add_column :options, :custom_value, :boolean, default: false
  end
end
