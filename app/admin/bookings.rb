ActiveAdmin.register Booking do
  permit_params :comment, :pdf, :foreman_id, :address1, :address2, :zipcode, :city, :country, :product_id, :surface, :reference, availability_ids: []
end
