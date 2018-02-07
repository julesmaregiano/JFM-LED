ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name, :role, :phone, :company, :branch

    index do
    column :id
    column :email
    column :first_name
    column :last_name
    column :company
    column :branch
    column :role
    column :phone
  end

end
