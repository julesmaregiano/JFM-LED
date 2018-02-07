ActiveAdmin.register Question do
  permit_params :name, :section, :option_group, :input_type, :active, :display
  menu parent: "Rapports"
end
