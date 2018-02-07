ActiveAdmin.register Section do
  permit_params :name
  menu parent: "Rapports"
end
