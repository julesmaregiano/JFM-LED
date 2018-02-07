ActiveAdmin.register Availability do
  permit_params :date, :half, :user_id, :booking_id, :status
end
