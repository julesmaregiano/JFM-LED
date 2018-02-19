ActiveAdmin.register Report do
  permit_params :booking_id, :signed_on
  menu parent: "Rapports"
end
