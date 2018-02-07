ActiveAdmin.register Answer do
  permit_params :question, :option_choice, :report_id, :numeric, :string, :boolean, :date
  menu parent: "Rapports"
end
